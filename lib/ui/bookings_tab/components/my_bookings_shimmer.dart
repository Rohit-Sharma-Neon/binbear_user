import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/animated_list_builder.dart';
import 'package:binbear/ui/base_components/base_booking_shimmer.dart';
import 'package:binbear/ui/bookings_tab/controller/bookings_controller.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class MyBookingsShimmer extends StatelessWidget {
  const MyBookingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, bottom: 80),
        itemBuilder: (context, index){
          return AnimatedListBuilder(
            index: index,
            child: BaseBookingShimmer(
              bottomMargin: 18,
              isPastBooking: Get.find<BookingsController>().tabController.index == 1,
            ),
          );
        },
      ),
    );
  }
}
