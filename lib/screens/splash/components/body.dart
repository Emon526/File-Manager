import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/constants/constants.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This is the best practice
import '../components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "texth": "Simplify your filing system",
      "textp": "keep your files organized more easily"
    },
    {
      "texth": "Easy to use",
      "textp": "User friendly design",
    },
    {
      "texth": "Optimized Feature",
      "textp": "enjoy the expolration",
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              0.7,
              1,
            ],
            colors: [
              AppColor.primarySplashColor,
              AppColor.primarySplashColor,
              AppColor.secondarySplashColor,
            ]),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(50),
            width: size.width * 0.9,
            height: size.height / 2 * 0.8,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: size.width * 0.9,
            height: size.height / 2 * 1,
            alignment: Alignment.center,
            child: Card(
              clipBehavior: Clip.antiAlias,
              //  color: AppColor.bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45.0)),

              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(55),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: PageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          itemCount: splashData.length,
                          itemBuilder: (BuildContext context, int index) =>
                              SplashContent(
                            texth: splashData[index]['textp'] ?? '',
                            textp: splashData[index]['texth'] ?? '',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(
                            10,
                            // horizontal: getProportionateScreenWidth(20)
                          ),
                          child: Column(
                            children: <Widget>[
                              Spacer(flex: 3),
                              Card(
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 56,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        AppColor.primaryButtonBgColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.offNamed('/home');
                                      // Get.toNamed('/home');
                                    },
                                    child: SingleLineText(
                                      text: "Let's Go",
                                      color: AppColor.primaryButtonTextColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
