import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:orange/auth/login/View/login_screen.dart';
import 'package:orange/auth/otp_verify/view/otp_verify_screen.dart';
import 'package:orange/bottom_nav_bar/view/bottom_nav_bar_screen.dart';
import 'package:orange/messege_section/chat/view/chat_screen.dart';
import 'package:orange/messege_section/purchase_text/view/purchase_screen.dart';
import 'package:orange/on_boarding/view/on_boardin_screen.dart';
import 'package:orange/profile_section/manage_account/manage_account/view/manage_account_screen.dart';
import 'package:orange/profile_section/manage_account/privacy_policy/view/peivecy_policy_screen.dart';
import 'package:orange/profile_section/manage_account/term_and_condition/view/terms_and_condition_screen.dart';
import 'package:orange/profile_section/manage_account/update_profile/view/update_profile_screen.dart' hide ManageAccountScreen;
import 'package:orange/profile_section/profile/view/profile_screen.dart';
import 'package:orange/profile_section/ring_exchange/free_ring_exchange/view/free_ring_exchane_screen.dart';
import 'package:orange/profile_section/ring_exchange/ring_exchange/view/ring_exchange_screen.dart';
import 'package:orange/profile_section/ring_exchange/ring_exchange/widgets/ring_exchange_purchase_successfull.dart';
import 'package:orange/profile_section/ring_exchange/ring_exchange/widgets/ring_exchange_purse_unsuccessfull.dart';
import 'package:orange/profile_section/special_event/view/special_event_screen.dart';
import 'package:orange/profile_section/support/view/support_screen.dart';
import 'package:orange/scanner_section/ambasidor/view/ambassader_screen.dart';
import 'package:orange/scanner_section/ambasidor/widget/custom_calender_widget.dart';
import 'package:orange/scanner_section/qr_code_ambassidor/view/qr_code_ambassidor_screen.dart';
import 'package:orange/splash/view/splash_screen.dart';

class AppRoute {
  //splash
  static const String splashScreen = '/splashScreen';
  static const String onBoardingScreen = '/onBoardingScreen';
  //auth
  static const String loginScreen = '/loginScreen';
  static const String otpverifyScreen = '/otpverifyScreen';
  static const String bottomNavBarScreen = '/BottomNavBarScreen';
  //profile
  static const String profileScreen = '/profileScreen';
  static const String manageAccountScreen = '/manageAccountScreen';
  static const String updateProfileScreen = '/updateProfileScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsAndConditionScreen = '/termsAndConditionScreen';
  static const String specialEventScreen = '/specialEventScreen';
  static const String supportScreen = '/supportScreen';
//ring exchange
  static const String ringExchangeScreen = '/ringExchangeScreen';
  static const String ringFreeExchangeScreen = '/ringFreeExchangeScreen';
  static const String ringExchangePurchaseSuccessScreen = '/ringExchangePurchaseSuccessScreen';
  static const String ringExchangePurchaseUnSuccessScreen = '/ringExchangePurchaseUnSuccessScreen';
//messege
  static const String chatScreen = '/chatScreen';
  static const String purchaseTextCreditsScreen = '/purchaseTextCreditsScreen';
  //qr scan
  //static const String qrScanScreen = '/qrScanScreen';
  static const String qrCodeAmbassidorScreen = '/qrCodeAmbassidorScreen';
  static const String schedulerScreen = '/schedulerScreen';
  static const String ambassadorScreen = '/ambassadorScreen';

 static String getProfileScreen() => profileScreen;
  static String getSplashScreen() => splashScreen;
  static String getOnBoardingScreen() => onBoardingScreen;
  static String getLoginScreen() => loginScreen;
  static String getOtpverificationScreen() => otpverifyScreen;
    static String getBottomNavBarScreen() => bottomNavBarScreen;
    static String getManageAccountScreen() => manageAccountScreen;
    static String getUpdateProfileScreen() => updateProfileScreen;
    static String getPrivacyPolicyScreen() => privacyPolicyScreen;
    static String getTermsAndConditionScreen() => termsAndConditionScreen;
    static String getRingExchangeScreen() => ringExchangeScreen;
    static String getRingFreeExchangeScreen() => ringFreeExchangeScreen;
    static String getRingExchangePurchaseSuccessScreen() => ringExchangePurchaseSuccessScreen;
    static String getRingExchangePurchaseUnSuccessScreen() => ringExchangePurchaseUnSuccessScreen;
    static String getSpecialEventScreen() => specialEventScreen;
    static String getSupportScreen() => supportScreen;
    static String getChatScreen() => chatScreen;
    static String getPurchaseTextCreditsScreen() => purchaseTextCreditsScreen;
     // static String getQrScanScreen() => qrScanScreen;
      static String getQrCodeAmbassidorScreen() => qrCodeAmbassidorScreen;
       static String getSchedulerScreen() => schedulerScreen;
       static String getAmbassadorScreen() => ambassadorScreen;


  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onBoardingScreen, page: () => OnBoardingScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: otpverifyScreen, page: () => OtpVerifyScreen()),
    GetPage(name: bottomNavBarScreen, page: () => BottomNavBarScreen()),
    GetPage(name: profileScreen, page: () => const ProfileScreen()),
    GetPage(name: manageAccountScreen, page: () => ManageAccountScreen()),
    GetPage(name: updateProfileScreen, page: () => UpdateProfileScreen()),
    GetPage(name: privacyPolicyScreen, page: () => PrivacyPolicyScreen()),
    GetPage(name: termsAndConditionScreen, page: () => TermsAndConditionScreen()),
    GetPage(name: ringExchangeScreen, page: () => RingExchangeScreen()),
    GetPage(name: ringFreeExchangeScreen, page: () => RingFreeExchangeScreen()),
    GetPage(name: ringExchangePurchaseSuccessScreen, page: () => RingExchangePurchaseSuccessScreen()),
    GetPage(name: ringExchangePurchaseUnSuccessScreen, page: () => RingExchangePurchaseUnSuccessScreen()),
    GetPage(name: specialEventScreen, page: () => SpecialEventScreen()),
    GetPage(name: supportScreen, page: () => SupportScreen()),


    GetPage(name: chatScreen, page: () => ChatScreen()),
    GetPage(name: purchaseTextCreditsScreen, page: () => PurchaseTextCreditsScreen()),
    GetPage(name: qrCodeAmbassidorScreen, page: () => QRCodeAmbassadorScreen()),
    GetPage(name: schedulerScreen, page: () => SchedulerScreen()),
    GetPage(name: ambassadorScreen, page: () => AmbassadorScreen()),

  ];
}
