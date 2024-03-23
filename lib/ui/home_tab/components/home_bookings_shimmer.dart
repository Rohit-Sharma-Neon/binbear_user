import 'package:binbear/ui/base_components/base_booking_shimmer.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';

class HomeBookingsShimmer extends StatelessWidget {
  const HomeBookingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          BaseBookingShimmer(leftMargin: horizontalScreenPadding, rightMargin: 6, isPastBooking: false),
          BaseBookingShimmer(rightMargin: horizontalScreenPadding, isPastBooking: false),
        ],
      ),
    );
  }
}
