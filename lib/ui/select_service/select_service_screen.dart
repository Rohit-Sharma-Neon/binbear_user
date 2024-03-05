import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_list_checkbox.dart';
import 'package:binbear/ui/base_components/base_page_sub_title.dart';
import 'package:binbear/ui/base_components/base_page_title.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/load_size_selection_screen.dart';
import 'package:binbear/ui/month_trash_cleaning_confirm_screen.dart';
import 'package:binbear/ui/select_service/controller/select_service_controller.dart';
import 'package:binbear/ui/week_or_month_selection_screen.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectServiceScreen extends StatefulWidget {

  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  SelectServiceController controller = Get.put(SelectServiceController());

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
        body: Column(
          children: [
            const BasePageTitle(
              topMargin: 0,
              title: "Schedule Pick-Up",
              bottomMargin: 0,
            ),
            const BasePageSubTitle(
              subTitle: "Select the Service\nThat Best Meets your Needs",
              bottomMargin: 17,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.serviceImages.length,
                itemBuilder: (context, index){
                  return Obx(()=>BaseListCheckbox(
                    itemCount: 3,
                    showMostPopularTag: index == 0,
                    imageUrl: controller.serviceImages[index],
                    title: controller.serviceTitles[index],
                    isChecked: controller.selectedServiceIndex.value == index,
                    onTap: (){
                      triggerHapticFeedback();
                      controller.selectedServiceIndex.value = index;
                    },
                  ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: horizontalScreenPadding, vertical: 14),
              width: double.infinity,
              color: Colors.white,
              child: BaseButton(
                title: 'Next',
                onPressed: (){
                  switch (controller.selectedServiceIndex.value) {
                    /// Can 2 Curb Service
                    case 0: {
                      Get.off(() => const WeekOrMonthSelectionScreen());
                      break;
                    }
                    /// Bulk Trash Pickup
                    case 1: {
                      Get.off(() => const SelectLoadSizeScreen());
                      break;
                    }
                    /// Trash Can Cleaning
                    case 2: {
                      Get.off(() => const MonthTrashCleaningConfirmScreen());
                      break;
                    }
                    default:
                      print(' invalid entry');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
