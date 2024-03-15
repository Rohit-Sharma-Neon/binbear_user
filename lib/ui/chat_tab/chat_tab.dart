import 'package:animate_do/animate_do.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_drawer.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/base_scaffold_chat_background.dart';
import 'package:binbear/ui/dashboard_module/dashboard_screen/controller/dashboard_controller.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffoldChatBackground(
      child: Scaffold(
        appBar: const BaseAppBar(
          title: "Chat",
          showNotification: true,
          showDrawerIcon: true,
        ),
        bottomNavigationBar: FadeInUp(
          duration: const Duration(milliseconds: 300),
          child: Container(
            padding: const EdgeInsets.only(bottom: 5, top: 5),
            margin: const EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: TextField(
              controller: TextEditingController(),
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15),
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Type here".tr,
                hintStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                counterStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
                counterText: null,
                counter: null,
                prefixIcon: GestureDetector(
                  onTap: (){
                    triggerHapticFeedback();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10, left: 15),
                    child: Icon(Icons.attach_file_outlined, size: 20),
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: (){
                    triggerHapticFeedback();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
                    child: Icon(Icons.send_rounded),
                  ),
                ),
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
