// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // Message Model
// class Message {
//   final String sender;
//   final String content;
//   final DateTime timeSent;

//   Message({
//     required this.sender,
//     required this.content,
//     required this.timeSent,
//   });
// }

// class ChatController extends GetxController {

//   var messages = <Message>[].obs;
//   final TextEditingController textController = TextEditingController();

//   @override
//   void onInit() {
//     super.onInit();

//     _addInitialMessage();
//   }

//   void _addInitialMessage() {
//     if (messages.isEmpty) {
//       messages.add(
//         Message(
//           sender: 'John Doe',
//           content: 'How are you?',
//           timeSent: DateTime.now().subtract(const Duration(minutes: 1)),
//         ),
//       );
//     }
//   }

//   void addMessage(String content) {
//     if (content.trim().isNotEmpty) {
//       messages.add(
//         Message(
//           sender: 'Molar', 
//           content: content,
//           timeSent: DateTime.now(),
//         ),
//       );
//       textController.clear();
//     }
//   }

//   @override
//   void onClose() {
//     textController.dispose();
//     super.onClose();
//   }
// }
// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:orange/core/base_url/base_url.dart';
// import 'package:orange/core/network/services/api_services.dart';
// import 'package:orange/messege_section/chat/model/chat_messege_model.dart';
// import 'package:orange/messege_section/messege/controller/messege_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class ChatController extends GetxController {
//   final ApiServices _apiServices = ApiServices();
//   final TextEditingController textController = TextEditingController();

//   var messages = <ChatMessageModel>[].obs;
//   var isLoading = false.obs;
  
//   String conversationId = '';
//   final int currentUserId = 1;
//   WebSocketChannel? _channel;

//   @override
//   void onInit() {
//     super.onInit();
//     final dynamic args = Get.arguments;
//     conversationId = args?['conversationId'] ?? '';
    
//     if (conversationId.isNotEmpty) {
//       fetchChatHistory();
//       _connectWebSocket();
//     }
//   }

//   Future<void> fetchChatHistory() async {
//     try {
//       isLoading.value = true;
//       final response = await _apiServices.get(
//         '/api/chat/conversations/$conversationId/messages/',
//         requireAuth: true,
//       );

//       if (response.statusCode == 200) {
//         final List data = response.data ?? [];
//         final parsedList = data.map((e) => ChatMessageModel.fromJson(e)).toList();
//         messages.assignAll(parsedList.reversed.toList());
//       }
//     } catch (e) {
//       log("Error fetching chat history: $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   Future<void> _connectWebSocket() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final String token = prefs.getString('access') ?? '';
      
//       final String wsUrl = '${BaseUrl.webSocketUrl}/$conversationId/?token=$token';
      
//       _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      
//       _channel?.stream.listen((message) {
//         log("WebSocket Inbound Data: $message");
//         final Map<String, dynamic> responseData = jsonDecode(message);
        
//         if (responseData['type'] == 'chat_message') {
//           final incomingMsg = ChatMessageModel.fromJson(responseData);
          
//           bool isDuplicate = messages.any((msg) => msg.id == incomingMsg.id && incomingMsg.id != 0);
//           if (!isDuplicate) {
//             messages.insert(0, incomingMsg);
//           }
//         }
//       }, onError: (error) {
//         log("WebSocket Error: $error");
//       }, onDone: () {
//         log("WebSocket Connection Closed");
//       });
//     } catch (e) {
//       log("WebSocket Connection Exception: $e");
//     }
//   }

//   void addMessage(String content) {
//     if (content.trim().isNotEmpty && _channel != null) {
//       final Map<String, dynamic> sendData = {
//         "type": "chat_message",
//         "content": content.trim()
//       };
      
//       _channel?.sink.add(jsonEncode(sendData));
//       textController.clear();
//     }
//     if (Get.isRegistered<MessegeController>()) {
//         Get.find<MessegeController>().fetchCreditBalance();
//       }
//   }

//   @override
//   void onClose() {
//     _channel?.sink.close();
//     textController.dispose();
//     super.onClose();
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange/core/base_url/base_url.dart';
import 'package:orange/core/network/services/api_services.dart';
import 'package:orange/messege_section/chat/model/chat_messege_model.dart';
import 'package:orange/messege_section/messege/controller/messege_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatController extends GetxController {
  final ApiServices _apiServices = ApiServices();
  final TextEditingController textController = TextEditingController();

  var messages = <ChatMessageModel>[].obs;
  var isLoading = false.obs;
  
  String conversationId = '';
  var currentUserId = ''.obs; 
  WebSocketChannel? _channel;
  
  bool _isDisposed = false;

  @override
  void onInit() {
    super.onInit();
    final dynamic args = Get.arguments;
    conversationId = args?['conversationId']?.toString() ?? '';
    
    if (conversationId.isNotEmpty) {
      _loadCurrentUserId().then((_) {
        fetchChatHistory();
        _connectWebSocket();
      });
    }
  }

  Future<void> _loadCurrentUserId() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('access_token') ?? prefs.getString('token') ?? prefs.getString('access') ?? '';
      
      if (token.isNotEmpty && token.contains('.')) {
        final parts = token.split('.');
        if (parts.length == 3) {
          final payload = utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
          final Map<String, dynamic> data = jsonDecode(payload);
          currentUserId.value = data['user_id']?.toString() ?? '';
          log("Chat DEBUG: Loaded Current User ID -> '${currentUserId.value}'");
        }
      }
    } catch (e) {
      log("Error loading user id in ChatController: $e");
    }
  }

  Future<void> fetchChatHistory() async {
    try {
      isLoading.value = true;
      final response = await _apiServices.get(
        '/api/chat/conversations/$conversationId/messages/',
        requireAuth: true,
      );

      if (response.statusCode == 200) {
        final List data = response.data ?? [];
        final parsedList = data.map((e) => ChatMessageModel.fromJson(e)).toList();
        messages.assignAll(parsedList.reversed.toList());
      }
    } catch (e) {
      log("Error fetching chat history: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _connectWebSocket() async {
    if (_isDisposed) return; 

    try {
      try {
        _channel?.sink.close();
      } catch (_) {}

      final prefs = await SharedPreferences.getInstance();
      final String token = prefs.getString('access_token') ?? prefs.getString('token') ?? prefs.getString('access') ?? '';
      
      final String wsUrl = '${BaseUrl.webSocketUrl}/$conversationId/?token=$token';
      log("WebSocket Connecting to: $wsUrl");
      
      _channel = WebSocketChannel.connect(Uri.parse(wsUrl));
      
      _channel?.stream.listen((message) {
        log("WebSocket Inbound Data: $message");
        final Map<String, dynamic> responseData = jsonDecode(message);
        
        if (responseData['type'] == 'chat_message') {
          final incomingMsg = ChatMessageModel.fromJson(responseData);
          
          bool isDuplicate = messages.any((msg) => msg.id == incomingMsg.id && incomingMsg.id != 0);
          if (!isDuplicate) {
            messages.insert(0, incomingMsg);
          }
          
          _triggerMessegeListRefresh();
        }
      }, onError: (error) {
        log("WebSocket Error encountered: $error");
        _handleReconnect();
      }, onDone: () {
        log("WebSocket Connection closed by server.");
        _handleReconnect();
      });
    } catch (e) {
      log("WebSocket Connection Exception: $e");
      _handleReconnect();
    }
  }

  void _handleReconnect() {
    if (_isDisposed) return;
    log("Attempting to reconnect WebSocket in 2 seconds...");
    Future.delayed(const Duration(seconds: 2), () {
      _connectWebSocket();
    });
  }

  void addMessage(String content) {
    if (content.trim().isNotEmpty && _channel != null) {
      final Map<String, dynamic> sendData = {
        "type": "chat_message",
        "content": content.trim()
      };
      
      try {
        _channel?.sink.add(jsonEncode(sendData));
        textController.clear();
        _triggerMessegeListRefresh();
      } catch (e) {
        log("Failed to send message over WebSocket: $e");
        _handleReconnect();
      }
    }
  }

  void _triggerMessegeListRefresh() {
    if (Get.isRegistered<MessegeController>()) {
      final messegeCtrl = Get.find<MessegeController>();
      messegeCtrl.fetchConversations();
      messegeCtrl.fetchCreditBalance();
    }
  }

  @override
  void onClose() {
    _isDisposed = true; 
    _channel?.sink.close();
    textController.dispose();
    super.onClose();
  }
}