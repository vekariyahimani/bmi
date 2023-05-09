import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../controller/bmi_controller.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _bmicalcScreenState();
}

class _bmicalcScreenState extends State<BmiScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? AlignTween;
  Animation? AlignTweenr;
  Animation? AlignTweencl;
  Animation? AlignTweencr;
  Animation? AlignTweenw;
  Animation<Offset>? AlignTweenh;

  BmiController? bmiControllertrue;
  BmiController? bmiControllerfalse;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    AlignTween =
        Tween<double>(begin: -5, end: -0.98).animate(animationController!);
    AlignTweenr =
        Tween<double>(begin: 5, end: 0.98).animate(animationController!);
    AlignTweencl =
        Tween<double>(begin: -2, end: -0.98).animate(animationController!);
    AlignTweencr =
        Tween<double>(begin: 2, end: 0.98).animate(animationController!);
    AlignTweenw =
        Tween<double>(begin: -5, end: -0.80).animate(animationController!);
    AlignTweenh =
        Tween<Offset>(begin: Offset(-1,1.5), end: Offset(0,1.5)).animate(animationController!);
    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    bmiControllertrue = Provider.of<BmiController>(context, listen: true);
    bmiControllerfalse = Provider.of<BmiController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(AlignTweencl!.value, -0.98),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.menu_open, color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.96),
                child: Text(
                  "BMI Calculator",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTweencr!.value, -0.98),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.person, color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment(AlignTween!.value, -0.75),
                child: InkWell(
                  onTap: () {
                    bmiControllertrue!.changeGender();
                  },
                  child: Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.man_rounded,
                            color: bmiControllerfalse!.male
                                ? Colors.blue
                                : Colors.blueGrey.shade600,
                            size: 80),
                        Text(
                          "Male",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTweenr!.value, -0.75),
                child: InkWell(
                  onTap: () {
                    bmiControllertrue!.changeGender2();
                  },
                  child: Container(
                    height: 180,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.girl_rounded,
                            color: bmiControllertrue!.female
                                ? Colors.blue
                                : Colors.blueGrey.shade600,
                            size: 85),
                        Text(
                          "Female",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SlideTransition(
                position: AlignTweenh!,
                // alignment: Alignment(AlignTweenh!.value, 0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${bmiControllertrue!.height.toInt()} ",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Cm",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 22),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Slider(
                        min: 1,
                        max: 300,
                        value: bmiControllertrue!.height.toDouble(),
                        activeColor: Colors.redAccent,
                        inactiveColor: Colors.black,
                        onChanged: (value) {
                          bmiControllerfalse!.changeHeight(value);
                          print(value);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTweenw!.value, 0.80),
                child: Container(
                  height: 170,
                  width: 155,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Weight",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${bmiControllertrue!.weight}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: InkWell(
                              onTap: () {
                                bmiControllertrue!.addWeight();
                              },
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                            child: InkWell(
                              onTap: () {
                                bmiControllertrue!.minweight();
                              },
                              child:
                                  Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTweenr!.value, 0.80),
                child: Container(
                  height: 170,
                  width: 155,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${bmiControllertrue!.age}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: InkWell(
                              onTap: () {
                                bmiControllertrue!.addage();
                              },
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white)),
                            child: InkWell(
                              onTap: () {
                                bmiControllertrue!.minage();
                              },
                              child:
                              Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 705),
                child: Align(
                  // alignment: Alignment(0, AlignTweenb!.value),
                  child: InkWell(
                    onTap: () {
                      if (bmiControllertrue!.weight != 0 && bmiControllertrue!.height!=0 && bmiControllertrue!.age != 0) {
                        bmiControllertrue!.answer();
                        Navigator.pushNamed(context, 'health');

                      } else {
                        Navigator.pushReplacementNamed(context, 'home');
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Calcutate Your BMI",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
