import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:orange/auth/login/widgets/custom_back_buttonwidgets.dart';
import 'package:orange/core/widgets/custom_image_background.dart';
import 'package:orange/routes/app_routes.dart';
import 'package:orange/scanner_section/ambasidor/controller/select_date_and_time_view_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../../core/utils/constants/app_colors.dart';


class SchedulerScreen extends StatelessWidget {
  SchedulerScreen({super.key});

  final SchedulerController controller =
      Get.put(SchedulerController());

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments
            as Map<String, dynamic>?;

    final title = args?['title'];

    return BackgroundImageScaffold(

      /// ---------------- BODY ----------------
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              /// ---------------- TOP BAR ----------------
              Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 10.h,
                ),
                child: Row(
                  children: [
CustomBackButtonwidget(),

                    Expanded(
                      child: Center(
                        child: Text(
                          "Select Date & Time",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.readColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// ---------------- CALENDAR SECTION ----------------
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  16,
                  20,
                  16,
                  20,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    /// ---------------- CALENDAR ----------------
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade200,
                          ),
                          borderRadius:
                              BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 4.h,
                        ),
                        child: TableCalendar(
                          availableGestures:
                              AvailableGestures
                                  .horizontalSwipe,

                          firstDay:
                              DateTime.utc(2024, 1, 1),

                          lastDay:
                              DateTime.utc(
                                  2035, 12, 31),

                          focusedDay:
                              controller
                                  .selectedDate.value,

                          headerStyle:
                              const HeaderStyle(
                            titleCentered: true,
                            formatButtonVisible:
                                false,
                          ),

                          calendarFormat:
                              CalendarFormat.month,

                          selectedDayPredicate:
                              (d) =>
                                  d.year ==
                                      controller
                                          .selectedDate
                                          .value
                                          .year &&
                                  d.month ==
                                      controller
                                          .selectedDate
                                          .value
                                          .month &&
                                  d.day ==
                                      controller
                                          .selectedDate
                                          .value
                                          .day,

                          onDaySelected:
                              (
                                selectedDay,
                                focusedDay,
                              ) {
                                controller.selectDate(
                                  selectedDay,
                                );
                              },

                          calendarStyle:
                              CalendarStyle(
                            todayDecoration:
                                BoxDecoration(
                              color: AppColors
                                  .readColor
                                  .withValues(
                                      alpha: 0.1),
                              shape:
                                  BoxShape.circle,
                            ),

                            selectedDecoration:
                                BoxDecoration(
                              color:
                                  AppColors.readColor,
                              shape:
                                  BoxShape.circle,
                            ),

                            todayTextStyle:
                                const TextStyle(
                              color: Colors.black,
                            ),

                            outsideDaysVisible:
                                true,
                          ),

                          enabledDayPredicate:
                              (day) {

                            final offset =
                                tzOffsets[
                                        controller
                                            .timezone
                                            .value] ??
                                    Duration.zero;

                            final now =
                                DateTime.now()
                                    .toUtc()
                                    .add(offset);

                            final today = DateTime(
                              now.year,
                              now.month,
                              now.day,
                            );

                            final d = DateTime(
                              day.year,
                              day.month,
                              day.day,
                            );

                            return !d.isBefore(
                              today,
                            );
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 15.h),

                    /// ---------------- TIMEZONE TITLE ----------------
                    Center(
                      child: Text(
                        "Time zone",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    SizedBox(height: 10.h),

                    /// ---------------- DROPDOWN ----------------
              Center(
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(
      vertical: 14,
    ),

    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.grey.shade300,
      ),

      borderRadius:
          BorderRadius.circular(10),

      color: Colors.white,
    ),

    child: Text(
      "US/Central",
      textAlign: TextAlign.center,

      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  ),
),
                  ],
                ),
              ),

              /// ---------------- TIME SLOTS ----------------
              Padding(
                padding:
                    const EdgeInsets.fromLTRB(
                  20,
                  6,
                  20,
                  14,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    /// ---------------- DATE TEXT ----------------
                    Obx(
                      () => Text(
                        DateFormat.yMMMMEEEEd()
                            .format(
                          controller
                              .selectedDate.value,
                        ),
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight:
                              FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// ---------------- SHOW TIMES BUTTON ----------------
                    ElevatedButton(
                      onPressed: () {

                        controller.selectDate(
                          controller
                              .selectedDate.value,
                        );
                      },

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.black,

                        minimumSize:
                            const Size(
                                double.infinity,
                                44),

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  10),
                        ),
                      ),

                      child: Text(
                        "Select orientation time",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color:
                              AppColors.textWhite,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    /// ---------------- SLOT LIST ----------------
                    Obx(
                      () => controller
                              .timeSlots.isEmpty
                          ? Center(
                              child: Text(
                                "No available times",
                                style: TextStyle(
                                  color: Colors
                                      .grey.shade600,
                                ),
                              ),
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics:
                                  const NeverScrollableScrollPhysics(),

                              itemCount: controller
                                  .timeSlots.length,

                              separatorBuilder:
                                  (_, __) =>
                                      const SizedBox(
                                height: 10,
                              ),

                              itemBuilder:
                                  (_, i) {

                                final slot =
                                    controller
                                        .timeSlots[i];

                                return Obx(
                                  () {
                                  final selected =
                                    controller
                                        .selectedSlot
                                        .value
                                        ?.slotUtc ==
                                      slot.slotUtc;

                                  return SizedBox(
                                    width:
                                      double.infinity,

                                    child:
                                      OutlinedButton(

                                    style:
                                      OutlinedButton.styleFrom(

                                      padding:
                                        const EdgeInsets.symmetric(
                                      vertical:
                                        14,
                                      ),

                                      backgroundColor:
                                        selected
                                          ? AppColors
                                            .readColor
                                          : Colors
                                            .white,

                                      side:
                                        BorderSide(
                                      color:
                                        selected
                                          ? AppColors
                                            .readColor
                                          : Colors
                                            .grey
                                            .shade300,
                                      ),

                                      shape:
                                        RoundedRectangleBorder(
                                      borderRadius:
                                        BorderRadius.circular(
                                          10),
                                      ),
                                    ),

                                    onPressed: () {
                                      controller
                                        .selectSlot(
                                          slot);
                                    },

                                    child: Text(
                                      slot.label,

                                      style:
                                        TextStyle(
                                      fontSize:
                                        15,

                                      fontWeight:
                                        FontWeight
                                          .w500,

                                      color:
                                        selected
                                          ? Colors
                                            .white
                                          : Colors
                                            .black87,
                                      ),
                                    ),
                                    ),
                                  );
                                  },
                                );
                              },
                            ),
                    ),

                    SizedBox(height: 24.h),

                    /// ---------------- BUTTONS ----------------
                    Row(
                      children: [

                        /// CANCEL
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {

                              controller
                                  .clearSelection();

                              Navigator.pop(
                                  context);
                            },

                            style:
                                ElevatedButton.styleFrom(

                              minimumSize:
                                  const Size(
                                      0, 48),

                              backgroundColor:
                                  Colors.white,

                              side: BorderSide(
                                color:
                                    Colors.black,
                                width: 1.w,
                              ),
                            ),

                            child: const Center(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color:
                                      Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 12.w),
SizedBox(
  width: 200.w,

  child: Obx(
    () => ElevatedButton(

      onPressed:
          controller.selectedSlot.value == null
              ? null
              : () {

                  debugPrint(
                    "-----------------------------",
                  );

                  debugPrint(
                    title.toString(),
                  );

                  Get.toNamed(
                    AppRoute.qrCodeAmbassidorScreen,
                    arguments: {
                      "type": title,
                    },
                  );
                },

      style: ElevatedButton.styleFrom(

        minimumSize:
            const Size(0, 48),

        backgroundColor:
            AppColors.readColor,

        side: BorderSide(
          color: AppColors.readColor,
          width: 1.w,
        ),
      ),

      child: Center(
        child: Text(
          "Done",

          style: TextStyle(
            color: AppColors.textWhite,
          ),
        ),
      ),
    ),
  ),
),
                      ],
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}