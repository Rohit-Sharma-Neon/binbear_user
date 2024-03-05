import 'package:animations/animations.dart';
import 'package:binbear/ui/base_components/base_outlined_button.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/bookings_tab/bookings_detail_screen.dart';
import 'package:binbear/ui/bookings_tab/controller/bookings_controller.dart';
import 'package:binbear/ui/chat_tab/chat_tab.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookingListTile extends StatelessWidget {
  final double? tileWidth;
  final double? topMargin, bottomMargin, rightMargin, leftMargin;
  final String location, date, time, distance;
  final bool isPastBooking;
  const BookingListTile({super.key, this.tileWidth, required this.location, required this.date, required this.time, required this.distance, this.topMargin, this.bottomMargin, this.rightMargin, this.leftMargin, required this.isPastBooking});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: rightMargin??0, bottom: bottomMargin??0, left: leftMargin??0, top: topMargin??0),
      child: OpenContainer(
          transitionDuration: const Duration(milliseconds: 400),
          transitionType: ContainerTransitionType.fade,
          openBuilder: (BuildContext context, VoidCallback _) {
            return BookingsDetailScreen(isPastBooking: isPastBooking);
          },
          middleColor: BaseColors.secondaryColor,
          openColor: BaseColors.secondaryColor,
          closedElevation: 0,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          closedColor: Colors.white,
          closedBuilder: (BuildContext context, VoidCallback openContainer) {
            return closedWidget(context: context);
          }),
    );
  }

  Widget closedWidget({required BuildContext context}){
    return Container(
      height: 170,
      width: tileWidth ?? MediaQuery.of(context).size.width/1.24,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                BaseAssets.icPin,
                color: BaseColors.primaryColor,
                width: 24,
                height: 24,
              ),
              Expanded(
                child: BaseText(
                  leftMargin: 8,
                  value: location,
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: (){
                  triggerHapticFeedback();
                  Get.to(() => const ChatTab());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 4),
                  child: SvgPicture.asset(BaseAssets.navChatUnselected),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(
                BaseAssets.icCalendar,
                width: 18,
                height: 18,
              ),
              BaseText(
                leftMargin: 10,
                value: date,
                fontSize: 13,
                color: const Color(0xff30302E),
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                BaseAssets.icClock,
                width: 18,
                height: 18,
              ),
              Expanded(
                child: BaseText(
                  leftMargin: 10,
                  value: time,
                  fontSize: 13,
                  color: const Color(0xff30302E),
                  fontWeight: FontWeight.w400,
                ),
              ),
              BaseOutlinedButton(
                topMargin: 0,
                leftMargin: 8,
                btnTopPadding: 6,
                btnBottomPadding: 6,
                btnRightPadding: 7,
                btnLeftPadding: 7,
                borderRadius: 8,
                title: "$distance miles",
                titleColor: BaseColors.primaryColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
