import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import '../../../../../core/utils/constants/app_colors.dart';
import '../../term_and_condition/view/terms_and_condition_screen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w,top: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                CustomBackButtonwidget(),
                  SizedBox(width: 85.w),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.readColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              // <-- Give the scrollable a bounded height
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget1(
                        redTitle: 'Privacy Policy',
                        subtitle:
                        'This website is owned and operated by Official AR, Ltd. amorerings.com. We are committed to protecting the privacy of our visitors while they interact with the content, products and services on this site (the “Site”).  This Privacy Policy applies to the Site only. It does not apply to other websites to which we link.  Because we gather certain types of information about our users, we want you to understand what information we collect about you, how we collect it, how that information is used, and how you can control our disclosure of it. We abide by the principles of legality, legitimacy, and transparency, use, and process the least data within a limited scope of purpose, and take technical and administrative measures to protect the security of the data. We use personal data to help verify accounts and user activity, as well as to promote safety and security, such as by monitoring fraud and investigating suspicious or potentially illegal activity or violations of our terms or policies. Such processing is based on our legitimate interest in helping ensure the safety of our products and services.  You agree that your use of the Site signifies your assent to this Privacy Policy. If you do not agree with this Privacy Policy, please do not use the Site.',
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Personal Data We Collect",
                        subtitle:
                        "Personal data is information that can be used to directly or indirectly identify you. Personal data also includes anonymous data that is linked to information that can be used to directly or indirectly identify you. We collect the personal data you provide when you use our products and services or otherwise interact with us, such as when you create an account, or to contact us. If you make a purchase, we collect personal data in connection with the purchase. This data includes your payment data, such as your credit or debit card number and other card information, and other account and authentication information, as well as billing, shipping, and contact details.Generally speaking, we use personal data to provide, improve, and develop our products and services, to communicate with you, and to protect us and our customers.  We never sell your personal data!",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Definition of Cookies",
                        subtitle:
                        "Cookies are small pieces of text used to store information on web browsers. Cookies are widely used to store and receive identifiers and other information on computers, phones, and other devices. We also use other technologies, including data we store on your web browser or device, identifiers associated with your device, and other software, for similar purposes. In this Cookie Statement, we refer to all of these technologies as “cookies.”",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Our Use Of Cookies",
                        subtitle:
                        "Cookies are small pieces of text used to store information on web browsers. Cookies are widely used to store and receive identifiers and other information on computers, phones, and other devices. We also use other technologies, including data we store on your web browser or device, identifiers associated with your device, and other software, for similar purposes. In this Cookie Statement, we refer to all of these technologies as “cookies.”",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Communications",
                        subtitle:
                        "We may use your personal data to send you marketing communications about our services through email or other means, provided you have given us your prior express consent. This may include newsletters, promotional material, and communications about your account or transactions, as well as information about our policies and terms. If you no longer wish to receive marketing emails, you may opt-out by contacting us or using the unsubscribe link located at the bottom of our emails.In some cases, we may send you direct marketing without your consent by relying on our legitimate interests, such as when you are already a customer. However, you have an absolute right to opt-out of all data processing we conduct for marketing purposes, including receiving marketing emails and profiling. This involves tailoring the content, advertisements, and marketing communications that you receive regarding our products and services. You may exercise this right at any time.Subject to your prior express consent, we may also use your personal data to personalize your experience with our products and services and on third-party websites and applications. Additionally, we may share your data with third-party partners who may send you marketing communications about their products and services. For any of the uses of your data that require your prior express consent, note that you may withdraw your consent by contacting us.We may also use your data to process and respond to your requests when you contact us.",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Changes To Our Privacy Policy",
                        subtitle:
                        "We may update this Privacy Statement periodically to align with advancements in technology, evolving industry standards, and regulatory mandates, among other considerations. Your ongoing utilization of our products and services following the effective date of the Privacy Statement indicates your acceptance of the updated terms. Should you disagree with the revised Privacy Statement, please refrain from using our products or services and reach out to us to close any associated accounts you may have created.",
                      ),

                      SizedBox(height: 20.h), // extra bottom padding so last text isn't flush to bottom
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}