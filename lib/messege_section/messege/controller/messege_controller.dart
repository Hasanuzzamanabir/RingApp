import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:orange/core/base_url/base_url.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/messege_section/messege/model/messege_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MessegeController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  final RxList<MessegeModel> _allMessages = <MessegeModel>[].obs;
  var messages = <MessegeModel>[].obs;
  var isLoading = false.obs;
  var selectedOption = ''.obs;
  var creditBalance = 0.obs;

  static const String _conversationsEndpoint = '/api/chat/conversations/';
  static const String _creditsEndpoint = '/api/chat/credits/';

  WebSocketChannel? _inboxChannel;
  bool _isDisposed = false;
  Timer? _reconnectTimer;

  @override
  void onInit() {
    super.onInit();
    fetchConversations().then((_) {
      _connectInboxWebSocket();
    });
    fetchCreditBalance();
  }

  Future<void> fetchConversations() async {
    try {
      isLoading.value = true;
      final response = await _apiServices.get(
        _conversationsEndpoint,
        requireAuth: true,
      );

      if (response.statusCode == 200) {
        final List data = response.data ?? [];
        final parsedList = data.map((e) => MessegeModel.fromJson(e)).toList();
        _allMessages.assignAll(parsedList);
        messages.assignAll(parsedList);
      }
    } catch (e) {
      log("Error fetching conversations: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _connectInboxWebSocket() async {
    if (_isDisposed) return;

    _reconnectTimer?.cancel();
    try {
      _inboxChannel?.sink.close();
    } catch (_) {}

    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('access_token') ?? prefs.getString('token') ?? prefs.getString('access') ?? '';
      
      if (token.isEmpty) {
        log("Inbox WebSocket: Token is empty, skipping connection.");
        return;
      }

      String rawBaseUrl = BaseUrl.baseUrl.trim();
      if (rawBaseUrl.startsWith('https://')) {
        rawBaseUrl = rawBaseUrl.replaceFirst('https://', 'wss://');
      } else if (rawBaseUrl.startsWith('http://')) {
        rawBaseUrl = rawBaseUrl.replaceFirst('http://', 'ws://');
      }
      
      if (rawBaseUrl.endsWith('/')) {
        rawBaseUrl = rawBaseUrl.substring(0, rawBaseUrl.length - 1);
      }

      final String wsUrl = '$rawBaseUrl/ws/inbox/?token=$token';
      log("Inbox WebSocket Hard-Fixed URL: $wsUrl");

      _inboxChannel = WebSocketChannel.connect(Uri.parse(wsUrl));

      _inboxChannel?.stream.listen((message) {
        log("Inbox WebSocket Inbound Event: $message");
        final Map<String, dynamic> eventData = jsonDecode(message);

        if (eventData['type'] == 'inbox_update') {
          final int targetConversationId = eventData['conversation_id'] ?? 0;
          final String newContent = eventData['content'] ?? '';
          
          String newTime = eventData['created_at'] ?? '';
          if (newTime.trim().isEmpty) {
            newTime = DateTime.now().toIso8601String(); 
          }

          int index = _allMessages.indexWhere((element) => element.id == targetConversationId);

          if (index != -1) {
            var oldModel = _allMessages[index];
            var updatedModel = MessegeModel(
              id: oldModel.id,
              participants: oldModel.participants,
              lastMessageContent: newContent,
              unreadCount: oldModel.unreadCount,
              createdAt: newTime,
            );

            _allMessages[index] = updatedModel;
            
            MessegeModel movedItem = _allMessages.removeAt(index);
            _allMessages.insert(0, movedItem);

            messages.clear();
            messages.assignAll(List.from(_allMessages));
            messages.refresh();
          } else {
            fetchConversations();
          }
          
          fetchCreditBalance();
        }
      }, onError: (error) {
        log("Inbox WebSocket Error: $error");
        _handleReconnect();
      }, onDone: () {
        log("Inbox WebSocket Closed.");
        _handleReconnect();
      });
    } catch (e) {
      log("Inbox WebSocket Exception: $e");
      _handleReconnect();
    }
  }

  void _handleReconnect() {
    if (_isDisposed) return;
    
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      log("Reconnecting Inbox WebSocket via Safe Timer...");
      _connectInboxWebSocket();
    });
  }

  Future<void> fetchCreditBalance() async {
    try {
      final response = await _apiServices.get(
        _creditsEndpoint,
        requireAuth: true,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        creditBalance.value = data['balance'] ?? 0;
      }
    } catch (e) {
      log("Error fetching credit balance: $e");
    }
  }

  Future<void> toggleBlockUser(String action, String userId) async {
    try {
      isLoading.value = true;
      final String url = '/api/chat/users/$userId/block/';
      dynamic response;

      if (action == 'Block') {
        response = await _apiServices.post(url, data: {}, requireAuth: true);
      } else if (action == 'Unblock') {
        response = await _apiServices.delete(url, requireAuth: true);
      }

      if (response != null && (response.statusCode == 201 || response.statusCode == 204)) {
        Get.snackbar(
          "Success", 
          "User ${action == 'Block' ? 'blocked' : 'unblocked'} successfully.",
          snackPosition: SnackPosition.BOTTOM
        );
        fetchConversations();
      }
    } catch (e) {
      log("Error processing $action: $e");
      Get.snackbar("Error", "Failed to $action user.", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void searchMessages(String query) {
    if (query.trim().isEmpty) {
      messages.assignAll(_allMessages);
    } else {
      final lowercaseQuery = query.toLowerCase().trim();
      messages.assignAll(
        _allMessages.where((msg) {
          return msg.participants.any((p) => 
            p.name.toLowerCase().contains(lowercaseQuery)
          );
        }).toList()
      );
    }
  }

  Future<void> scanAndConnectUser(String qrSlug) async {
    try {
      isLoading.value = true;
      final response = await _apiServices.post(
        '/api/chat/scan/$qrSlug/',
        data: {},
        requireAuth: true,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar(
          "Success", 
          "Connection updated successfully!",
          snackPosition: SnackPosition.BOTTOM
        );
        await Future.delayed(const Duration(milliseconds: 500));
        fetchConversations();
      }
    } catch (e) {
      log("Error scanning QR code: $e");
      Get.snackbar("Error", "Failed to connect via QR code.", snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  void updateSelection(String option) {
    selectedOption.value = option;
  }

  @override
  void onClose() {
    _isDisposed = true;
    _reconnectTimer?.cancel();
    _inboxChannel?.sink.close();
    super.onClose();
  }
}