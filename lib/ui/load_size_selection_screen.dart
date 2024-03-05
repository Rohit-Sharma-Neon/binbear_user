import 'package:binbear/ui/base_components/base_button.dart';
import 'package:binbear/ui/base_components/base_list_checkbox.dart';
import 'package:binbear/ui/base_components/base_page_sub_title.dart';
import 'package:binbear/ui/base_components/base_page_title.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/load_size_confirm_screen.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLoadSizeScreen extends StatefulWidget {

  const SelectLoadSizeScreen({super.key});

  @override
  State<SelectLoadSizeScreen> createState() => _SelectLoadSizeScreenState();
}

class _SelectLoadSizeScreenState extends State<SelectLoadSizeScreen> {

  int selectedLoadSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldBackground(
      child: Scaffold(
        appBar: const BaseAppBar(),
        body: Column(
          children: [
            const BasePageTitle(
              topMargin: 0,
              title: "Bulk Trash Pickup",
              bottomMargin: 0,
            ),
            const BasePageSubTitle(
              subTitle: "Please select the appropriate load size",
              bottomMargin: 20,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: loadSizeImages.length,
                itemBuilder: (context, index){
                  return BaseListCheckbox(
                    itemCount: 3,
                    imageUrl: loadSizeImages[index],
                    title: "${loadSizeTitles[index]} : ",
                    isChecked: selectedLoadSizeIndex == index,
                    price: "\$ ${loadSizePrices[index]}",
                    onTap: (){
                      triggerHapticFeedback();
                      setState(() {
                        selectedLoadSizeIndex = index;
                      });
                    },
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
                  Get.off(() => LoadSizeConfirmScreen(
                    selectedLoadSizeTitle: loadSizeTitles[selectedLoadSizeIndex],
                    selectedLoadSizeImage: loadSizeImages[selectedLoadSizeIndex],
                    selectedLoadSizePrice: loadSizePrices[selectedLoadSizeIndex],
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> loadSizeImages = <String>[
    "assets/delete/ic_medium_truck.svg",
    "assets/delete/ic_large_truck.svg",
    "assets/delete/ic_xl_truck.svg",
  ];

  List<String> loadSizeTitles = [
    "Medium",
    "Large",
    "XL - Multiple",
  ];

  List<String> loadSizePrices = [
    "50",
    "100",
    "200",
  ];
}
