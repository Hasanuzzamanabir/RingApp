import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:orange/core/utils/constants/icon_path.dart';
import 'package:orange/core/utils/constants/image_path.dart';
import 'package:orange/profile_section/profile/controller/profile_screen_controller.dart';

Widget profileAvatar(
  ProfileController controller,
  double radius,
) {
  return Obx(() {

    // ================= LOCAL IMAGE =================

    if (controller.profileImage.value != null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(
          controller.profileImage.value!,
        ),
      );
    }

    // ================= NETWORK IMAGE =================

    if (controller.profilePictureUrl.value.isNotEmpty) {

      final imageUrl =
          controller.profilePictureUrl.value;

      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,

        child: ClipOval(
          child: Image.network(
            imageUrl,

            key: ValueKey(imageUrl),

            width: radius * 2,
            height: radius * 2,

            fit: BoxFit.cover,

            gaplessPlayback: false,

            errorBuilder: (_, __, ___) {
              return Image.asset(
                ImagePath.profileImage,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      );
    }

    // ================= DEFAULT IMAGE =================

    return CircleAvatar(
      radius: radius,
      backgroundImage:
          const AssetImage(IconPath.profileIcon),
    );
  });
}