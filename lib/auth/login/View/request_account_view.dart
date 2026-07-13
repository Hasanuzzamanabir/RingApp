import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // FilteringTextInputFormatter এর জন্য
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/utils/constants/app_colors.dart';
import 'package:orange/core/utils/constants/custom_text.dart';
import 'package:orange/core/widgets/custom_button_widget.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/on_boarding/widget/custom_logo_svg_image.dart';

class RequestAccountScreen extends StatefulWidget {
  const RequestAccountScreen({super.key});

  @override
  State<RequestAccountScreen> createState() => _RequestAccountScreenState();
}

class _RequestAccountScreenState extends State<RequestAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _firstNameController = TextEditingController();
  final _zipCodeController = TextEditingController();

  String? _selectedRingColor;
  final List<String> _ringColors = ["Black", "Silver", "Gold", "Rose Gold"];

  final RxBool _isLoading = false.obs;

  @override
  void dispose() {
    _firstNameController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImageScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  const CustomBackButtonwidget(),
                  SizedBox(height: 40.h),
                  
                  const CustomAppLogoSvgImage(width: 100, height: 95),
                  SizedBox(height: 20.h),

                  CustomText(
                    text: "Request for an Account",
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.readColor, 
                  ),
                  SizedBox(height: 10.h),
                  
                  CustomText(
                    text: "Please provide your purchase details below.",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textGrey,
                  ),
                  SizedBox(height: 30.h),

                  // ১. First Name Input Field
                  TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Colors.black),
                    decoration: _buildInputDecoration(
                      hintText: "Enter the name used in purchase",
                      prefixIcon: Icons.person_outline,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "First name cannot be empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),

                  // ২. Ring Color Dropdown Menu
                  DropdownButtonFormField<String>(
                    value: _selectedRingColor,
                    style: const TextStyle(color: Colors.black),
                    dropdownColor: Colors.white,
                    decoration: _buildInputDecoration(
                      hintText: "Select your ring color",
                      prefixIcon: Icons.color_lens_rounded,
                    ),
                    icon: const Icon(Icons.arrow_drop_down_circle_sharp, color: AppColors.readColor),
                    items: _ringColors.map((String color) {
                      return DropdownMenuItem<String>(
                        value: color,
                        child: Text(color),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _selectedRingColor = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select a ring color";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.h),

                  TextFormField(
                    controller: _zipCodeController,
                    keyboardType: TextInputType.number,
                    maxLength: 6, 
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, 
                    ],
                    style: const TextStyle(color: Colors.black),
                    decoration: _buildInputDecoration(
                      hintText: "Enter 6 digit shipping zip code",
                      prefixIcon: Icons.pin_drop_outlined,
                    ).copyWith(
                      counterText: "",
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Zip code cannot be empty";
                      }
                      if (value.trim().length != 6) {
                        return "Zip code must be exactly 6 digits";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 40.h),

                  // ৪. SUBMIT Button
                  Obx(() {
                    return CustomButtonWidget(
                      title: _isLoading.value ? "Submitting..." : "SUBMIT",
                      onTap: _isLoading.value
                          ? null 
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                _submitRequest();
                              }
                            },
                    );
                  }),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration({required String hintText, required IconData prefixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14.sp),
      prefixIcon: Icon(prefixIcon, color: Colors.grey.shade600),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Colors.redAccent), 
      ),
    );
  }


  void _submitRequest() async {
    _isLoading.value = true;
    
    await Future.delayed(const Duration(seconds: 2));
    
    _isLoading.value = false;
    
    Get.back();
    
    Get.snackbar(
      "Success", 
      "Your request submitted",
      snackPosition: SnackPosition.TOP, 
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
      margin: EdgeInsets.all(15.w),
      duration: const Duration(seconds: 3),
    );
  }
}