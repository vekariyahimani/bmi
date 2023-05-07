import 'package:bmi/screen/controller/bmi_controller.dart';
import 'package:bmi/screen/view/bmi_screen.dart';
import 'package:bmi/screen/view/data_screen.dart';
import 'package:bmi/screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
      Sizer(
        builder: (context, orientation, deviceType) =>ChangeNotifierProvider(
          create: (context) => BmiController(),
          child:   GetMaterialApp(

            debugShowCheckedModeBanner: false,

            routes: {

              '/':(p0) => SplshScreen(),

              'home':(p0) => BmiScreen(),
              'health':(p0) => healthScreen(),

            },

          ),
        ),
      )
  );
}