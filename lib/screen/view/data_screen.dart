import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bmi_controller.dart';


class healthScreen extends StatefulWidget {
  const healthScreen({Key? key}) : super(key: key);

  @override
  State<healthScreen> createState() => _healthScreenState();
}

class _healthScreenState extends State<healthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? AlignTweenmenu;
  Animation? AlignTweenperson;
  Animation? AlignTweenContainer1;
  Animation? AlignTweenContainer2;
  Animation? AlignTweenContainer3;
  BmiController? bt,bf;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    AlignTweenmenu =
        Tween<double>(begin: -2, end: -0.98).animate(animationController!);
    AlignTweenperson =
        Tween<double>(begin: 5, end: 0.9).animate(animationController!);
    AlignTweenContainer1 =
        Tween<double>(begin: -100, end: 0).animate(animationController!);
    AlignTweenContainer2 =
        Tween<double>(begin: 100, end: 0).animate(animationController!);
    AlignTweenContainer3 =
        Tween<double>(begin: 2, end: 0.9).animate(animationController!);

    animationController!.forward();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    bt = Provider.of<BmiController>(context,listen: true);
    bf = Provider.of<BmiController>(context,listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(AlignTweenmenu!.value, -0.98),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_back_ios_new,
                      size: 20, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.95),
                child: Text(
                  "BMI Info",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(AlignTweenContainer1!.value, 0),
                child: Container(
                  height: 300,
                  width: 330,
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment(0, -0.8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Your BMI",
                              style: TextStyle(
                                  color: Colors.blueGrey.shade600, fontSize: 15),
                            ),
                            Text(
                              "${bt!.body}",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Normal Health",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.5),
                        child: Container(
                          height: 200,
                          width: 200,
                          child: CircularProgressIndicator(
                            color: Colors.blueGrey.shade600,
                            backgroundColor: Colors.white12,
                            value: bt!.result/100,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.2),
                        child: Text(
                          "${(bt!.result).toString().substring(0,4)} %",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, AlignTweenContainer3!.value),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    width: 260,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.shade200,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Text(
                        "Re-Calculate",
                        style: TextStyle(color: Colors.white, fontSize: 23),
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