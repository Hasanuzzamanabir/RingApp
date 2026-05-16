import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import '../../../../../core/utils/constants/app_colors.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

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
                  SizedBox(width: 65.w),
                  Text(
                    "Terms & Conditions",
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
                        redTitle: 'Terms and Conditions',
                        subtitle:
                        'These terms and conditions oversee your utilization of this website.  Your use of this website implies your full acceptance of these terms and conditions.  If you disagree with any part of these terms and conditions, please do not use the Site.Unless stated otherwise, we retain the intellectual property rights to the website and its content. You may only view, download, or print pages or content from the website for personal use, solely for caching purposes, subject to the restrictions outlined below and elsewhere in these terms and conditions.You are prohibited from misusing this Website.  This includes, but is not limited to, engaging in criminal activities, transmitting harmful software such as viruses or worms, posting malicious or offensive material, attempting unauthorized access to the Service, disrupting the functionality of the website, infringing upon proprietary rights, sending unsolicited advertising (spam), or attempting to interfere with the performance of our computer systems or those of our partners.  You are also not permitted to excessively stress the website, such as by creating excessive session lengths or conducting abusive search queries.  We reserve the right to monitor your website usage to ensure compliance with these Terms of Service and may provide guidance and assistance as needed.  By using the website, you acknowledge and consent to this monitoring.  You must not use this website in any way that causes, or may cause, damage to the website or impairment of the availability or accessibility of the website; or in any way which is unlawful, illegal, fraudulent or harmful, or in connection with any unlawful, illegal, fraudulent or harmful purpose or activity.You are prohibited from engaging in any systematic or automated data collection activities, including scraping, data mining, extraction, or harvesting, on or related to this website without our explicit written consent.Additionally, you must refrain from using this website to transmit unsolicited commercial communications or for any marketing-related purposes without our explicit written consent.',
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "User Content",
                        subtitle:
                        "In these terms and conditions, “your user content” refers to material (including but not limited to text, images, audio, video, and audio-visual material) that you upload or submit to this website, for any purpose whatsoever.By submitting user content to this website, you grant us a worldwide, irrevocable, non-exclusive, royalty-free license to use, reproduce, adapt, publish, translate, and distribute your user content in any present or future media. You also grant us the right to sublicense these rights and to take legal action against any infringement of these rights.Your user content must not be illegal or unlawful, must not violate any third party’s legal rights, and must not lead to legal action being taken against you or a third party under any applicable law.You are prohibited from submitting any user content to the website that is currently or has been the subject of threatened or actual legal proceedings or similar complaints.",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Limitation of Liability and Warranty",
                        subtitle:
                        "Subject to the standard terms of sale governing the purchase of each product on this site, the products offered for sale and the transactions conducted through it are provided by us. We do not make any representations or warranties, express or implied, regarding the operation of the site or the information, content, materials, or products included on this site, except as provided herein to the fullest extent permitted by applicable law. We explicitly disclaim all warranties, including but not limited to implied warranties of merchantability, fitness for a particular purpose, non-infringement, title, quiet enjoyment, data accuracy, and system integration.",
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        "This site may contain inaccuracies, mistakes, or typographical errors, and we do not warrant that the content will be uninterrupted or error-free. To the maximum extent permitted by law, we shall not be liable for any damages arising from the use of this site, including but not limited to indirect, incidental, punitive, exemplary, special, or consequential damages.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Furthermore, our total liability to you for any damages, regardless of the basis for the action, shall not exceed the aggregate amount of fees paid by you to us during the month immediately preceding the event allegedly giving rise to our liability, to the fullest extent permitted by applicable law.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Order Acceptance",
                        subtitle:
                        "Please be aware that certain orders may not be accepted and may need to be canceled. We reserve the right, at our sole discretion, to refuse or cancel any order for any reason. Instances that may lead to order cancellation include limitations on available quantities, inaccuracies or errors in product or pricing information, or issues flagged by our credit and fraud prevention department. Additional verification or information may also be required before an order is accepted. If any part of your order is canceled or further information is needed, we will promptly contact you.",
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        "Both parties agree that once an order is dispatched, transportation becomes the sole responsibility of the third-party logistics company. At this stage, full ownership of the product(s) transfers to the buyer, who assumes all associated liability and risks during transportation.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Sale Terms",
                        subtitle:
                        "By making a purchase, you acknowledge and agree that all product purchases made through the Site are subject to our Delivery and Returns as well as Exchanges terms and conditions.",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Termination",
                        subtitle:
                        "You consent to our ability, at our sole discretion, to terminate your access to the Site at any time, with or without cause, and without prior notice to you. We shall not be held liable to you or any third party for any claims or damages resulting from such termination or suspension, or any other actions taken by us in relation to it.",
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        "If applicable law mandates that we provide notice of termination or cancellation, we may do so by posting it on the Site or by sending a communication to any contact information (email or otherwise) that we have on file for you.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Trademark Notice",
                        subtitle:
                        "All trademarks, logos, and service marks displayed on this website are the property of the company or its affiliated companies and are registered trademarks or trademarks protected by law. Any infringement will be prosecuted to the fullest extent permitted by law. Without prior written approval from us or the related trademark owner, companies and individuals are prohibited from using, copying, downloading permanently, modifying, distributing, copying, or bundling sales with other products, or registering domain names or wireless website names containing any part of the trademark for any reason or purpose.",
                      ),
                      SizedBox(height: 10.h),
                      CustomTextWidget1(
                        redTitle: "Governing Law",
                        subtitle:
                        "These Terms of Service and any separate agreements whereby we provide you shall be governed by and construed in accordance with the laws of the State of Illinois, USA.",
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

class CustomTextWidget1 extends StatelessWidget {
  const CustomTextWidget1({
    super.key,
    required this.redTitle,
    required this.subtitle,
  });
  final String redTitle, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          redTitle,
          style: TextStyle(
            color: AppColors.readColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5.h),
        Text(
          subtitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
