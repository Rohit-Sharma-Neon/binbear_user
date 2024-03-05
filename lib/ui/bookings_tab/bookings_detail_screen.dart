import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_container.dart';
import 'package:binbear/ui/base_components/base_outlined_button.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/base_text_button.dart';
import 'package:binbear/ui/bookings_tab/components/rating_bottom_sheet.dart';
import 'package:binbear/ui/chat_tab/chat_tab.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingsDetailScreen extends StatelessWidget {
  final bool isPastBooking;
  const BookingsDetailScreen({super.key, required this.isPastBooking});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const BaseAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalScreenPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BaseText(
                    topMargin: 75,
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
                    const BaseText(
                      value: "Can 2 Curb Service",
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const BaseText(
                      value: "Weekly Service",
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ]),
                  bookingDetailsTile(children: [
                    const BaseText(
                      value: "Time",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    const BaseText(
                      value: "Between 6 PM prior evening to 6 AM Service Day",
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const BaseText(
                      topMargin: 8,
                      value: "No. of Cans",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    const BaseText(
                      value: "3",
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ]),
                  bookingDetailsTile(children: [
                    const BaseText(
                      value: "Pick-up Location",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    const BaseText(
                      topMargin: 4,
                      value: "123, bellaforte, USA",
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ]),
                  bookingDetailsTile(children: [
                    const BaseText(
                      value: "Paid Amount",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    const BaseText(
                      topMargin: 4,
                      value: "\$400.00",
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ]),
                  (isPastBooking??false) ?
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
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, top: 16, bottom: 10),
            color: Colors.white,
            child: isPastBooking ? Row(
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
                              return const RatingBottomSheet();
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
