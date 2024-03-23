import 'package:binbear/ui/base_components/animated_column.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_outlined_button.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_text_button.dart';
import 'package:binbear/ui/base_components/smart_refresher_base_header.dart';
import 'package:binbear/ui/booking_details/controller/booking_details_controller.dart';
import 'package:binbear/ui/booking_details/rating_bottom_sheet.dart';
import 'package:binbear/ui/chat_tab/chat_tab.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BookingsDetailScreen extends StatefulWidget {
  final bool isPastBooking;
  final String bookingId;
  const BookingsDetailScreen({super.key, required this.isPastBooking, required this.bookingId});

  @override
  State<BookingsDetailScreen> createState() => _BookingsDetailScreenState();
}

class _BookingsDetailScreenState extends State<BookingsDetailScreen> {
  BookingDetailsController controller = Get.put(BookingDetailsController());

  @override
  void initState() {
    super.initState();
    controller.getBookingDetails(bookingId: widget.bookingId);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: const BaseAppBar(),
          body: Padding(
            padding: const EdgeInsets.only(top: 75),
            child: SmartRefresher(
              controller: controller.refreshController,
              header: const SmartRefresherBaseHeader(),
              onRefresh: (){
                controller.getBookingDetails(bookingId: widget.bookingId);
              },
              child: SingleChildScrollView(
                child: AnimatedColumn(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BaseText(
                      topMargin: 0,
                      value: "Booking Detail",
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    bookingDetailsTile(children: [
                      const BaseText(
                        value: "Service",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const BaseShimmer(
                            width: double.infinity,
                            height: 27,
                            rightMargin: 40,
                          );
                        }else{
                          return BaseText(
                            value: controller.bookingDetailsData?.categoryData?.title??"",
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          );
                        }
                      }),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const BaseShimmer(
                            topMargin: 3,
                            width: double.infinity,
                            height: 22,
                            rightMargin: 180,
                          );
                        }else{
                          return BaseText(
                            value: "${controller.bookingDetailsData?.subCategoryData?.title??""} Service",
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          );
                        }
                      }),
                    ]),
                    bookingDetailsTile(children: [
                      const BaseText(
                        value: "Time",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseShimmer(
                                topMargin: 3,
                                width: double.infinity,
                                height: 18,
                              ),
                              BaseShimmer(
                                topMargin: 3,
                                width: double.infinity,
                                height: 18,
                                rightMargin: 180,
                              ),
                            ],
                          );
                        }else{
                          return BaseText(
                            value: controller.bookingDetailsData?.time??"",
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          );
                        }
                      }),
                      const BaseText(
                        topMargin: 8,
                        value: "No. of Cans",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const BaseShimmer(
                            topMargin: 3,
                            width: 12,
                            height: 20,
                          );
                        }else{
                          return BaseText(
                            value: controller.bookingDetailsData?.noOfCane?.toString()??"",
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          );
                        }
                      }),
                    ]),
                    bookingDetailsTile(children: [
                      const BaseText(
                        value: "Pick-up Location",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const BaseShimmer(
                            topMargin: 2,
                            width: double.infinity,
                            height: 21,
                            rightMargin: 130,
                          );
                        }else{
                          return const BaseText(
                            value: "123, bellaforte, USA",
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          );
                        }
                      }),
                    ]),
                    bookingDetailsTile(children: [
                      const BaseText(
                        value: "Paid Amount",
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return const BaseShimmer(
                            topMargin: 3,
                            width: double.infinity,
                            height: 41,
                            rightMargin: 200,
                          );
                        }else{
                          return BaseText(
                            topMargin: 4,
                            value: "\$${controller.bookingDetailsData?.price?.toString()??""}",
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          );
                        }
                      }),
                    ]),
                    (widget.isPastBooking) ?
                    BaseTextButton(
                      topMargin: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(BaseAssets.icInvoice),
                            const BaseText(
                              leftMargin: 8,
                              value: "Download Invoice",
                              fontSize: 13,
                              color: Color(0xffFBE6D3),
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                    ) :
                    const BaseOutlinedButton(
                      topMargin: 10,
                      title: "On The Way",
                      titleColor: BaseColors.primaryColor,
                      btnLeftPadding: 10,
                      btnRightPadding: 10,
                      btnBottomPadding: 5,
                      btnTopPadding: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, top: 16, bottom: 10),
            color: Colors.white,
            child: widget.isPastBooking ? Row(
              children: [
                const Expanded(child: BaseButton(title: "Re-Book", rightMargin: 6, btnColor: BaseColors.secondaryColor,)),
                Expanded(
                    child: BaseButton(
                      title: "Give Rating",
                      leftMargin: 6,
                      onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (context){
                              return RatingBottomSheet(bookingId: widget.bookingId,);
                        });
                      },
                    ),
                ),
              ],
            ) : BaseButton(
              leftMargin: 0,
              rightMargin: 0,
              title: "Chat With Service Provider",
              onPressed: (){
                Get.to(() => const ChatTab());
              },
            ),
          ),
        ),
    );
  }

  Widget bookingDetailsTile({required List<Widget> children}){
    return BaseContainer(
      topMargin: 18,
      bottomMargin: 0,
      borderRadius: 14,
      topPadding: 12,
      bottomPadding: 15,
      rightPadding: 15,
      leftPadding: 15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
