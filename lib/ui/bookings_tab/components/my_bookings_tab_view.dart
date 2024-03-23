import 'package:binbear/ui/base_components/animated_list_builder.dart';
import 'package:binbear/ui/base_components/base_no_data.dart';
import 'package:binbear/ui/base_components/bookings_tile.dart';
import 'package:binbear/ui/base_components/smart_refresher_base_header.dart';
import 'package:binbear/ui/booking_details/bookings_detail_screen.dart';
import 'package:binbear/ui/bookings_tab/components/my_bookings_shimmer.dart';
import 'package:binbear/ui/bookings_tab/controller/bookings_controller.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyBookingsTabView extends StatelessWidget {
  const MyBookingsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingsController controller = Get.find<BookingsController>();
    return AnimationLimiter(
      child: Obx(()=> SmartRefresher(
        controller: (controller.tabController.index == 0) ? controller.upcomingRefreshController : controller.pastRefreshController,
        header: const SmartRefresherBaseHeader(),
        onRefresh: (){
          controller.getMyBookingsApi();
        },
        child: controller.isLoading.value ? const MyBookingsShimmer() : (controller.list?.length??0) == 0 ? const BaseNoData() :  ListView.builder(
          shrinkWrap: true,
          itemCount: controller.list?.length??0,
          padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, bottom: 80),
          itemBuilder: (context, index){
            return AnimatedListBuilder(
              index: index,
              child: BookingListTile(
                bottomMargin: 18,
                isPastBooking: controller.tabController.index == 1,
                location: "123, bellaforte, USA",
                date: formatBackendDate(controller.list?[index].createdAt??""),
                time: controller.list?[index].time??"",
                distance: controller.list?[index].distance?.toString()??"",
                onTap: (){
                  Get.to(() => BookingsDetailScreen(isPastBooking: controller.tabController.index == 1, bookingId: controller.list?[index].id?.toString()??""));
                },
              ),
            );
          },
        ),
      ),
      ),
    );
  }
}
