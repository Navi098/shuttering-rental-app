
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shuttring_hub/common_widget/basic_app_bar.dart';
import 'package:shuttring_hub/utils/app_color.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: BasicAppBar(
        onTap: (){
          Get.back();
        },
        line: true,
        title: "Notifications",
      ),
      body: Center(
        child: Text("No Notification"),
      ),
    );
  }
}
