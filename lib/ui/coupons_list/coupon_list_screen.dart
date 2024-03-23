import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_no_data.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_text.dart';
import 'package:binbear/ui/base_components/smart_refresher_base_header.dart';
import 'package:binbear/ui/coupons_list/components/coupon_list_shimmer.dart';
import 'package:binbear/ui/coupons_list/controller/coupon_list_controller.dart';
import 'package:binbear/utils/base_assets.dart';
import 'package:binbear/utils/base_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CouponListScreen extends StatefulWidget {
  const CouponListScreen({super.key});

  @override
  State<CouponListScreen> createState() => _CouponListScreenState();
}

class _CouponListScreenState extends State<CouponListScreen> {
  CouponListController controller = Get.put(CouponListController());
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(
          title: "Coupon Code",
          contentColor: Colors.white,
          titleSize: 22,
          fontWeight: FontWeight.w600,
        ),
        body: Obx(()=> SmartRefresher(
          controller: controller.refreshController,
          header: const SmartRefresherBaseHeader(),
          onRefresh: (){
            controller.getCouponList();
          },
          child: controller.isCouponListLoading.value ? const CouponListShimmer() : (controller.couponList?.length??0) == 0 ? const BaseNoData(message: "No Coupons Found!",) : ListView.builder(
                itemCount: controller.couponList?.length??0,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 5),
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset(BaseAssets.bgCoupon),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BaseText(
                              value: "\$${controller.couponList?[index].discount?.toString()??""} Off",
                              fontSize: 30,
                              color: BaseColors.primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                            BaseText(
                              topMargin: 10,
                              value: controller.couponList?[index].couponCode?.toString()??"",
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            BaseButton(
                              topMargin: 15,
                              title: "Apply Now",
                              btnHeight: 34,
                              fontSize: 12,
                              borderRadius: 14,
                              btnWidth: Get.width/3,
                              onPressed: (){
                                Get.back();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }),
        ),
        ),
      ),
    );
  }
}
