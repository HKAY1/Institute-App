import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:imstitute/controller/authorisation_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late FocusNode userFocus;
  late FocusNode passFocus;
  late FocusNode loginFocus;
  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;
  var logincontroll = Get.put(AuthrisationController());

  @override
  void initState() {
    super.initState();
    userFocus = FocusNode();
    passFocus = FocusNode();
    loginFocus = FocusNode();
    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  var usercontroll = TextEditingController();
  var passcontroll = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isvisible = false;

// 0xff189ab4
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff05445e),
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: size.height * (animation2.value + .58),
              left: size.width * .21,
              child: CustomPaint(
                painter: MyPainter(50),
              ),
            ),
            Positioned(
              top: size.height * .98,
              left: size.width * .1,
              child: CustomPaint(
                painter: MyPainter(animation4.value - 30),
              ),
            ),
            Positioned(
              top: size.height * .5,
              left: size.width * (animation2.value + .8),
              child: CustomPaint(
                painter: MyPainter(30),
              ),
            ),
            Positioned(
              top: size.height * animation3.value,
              left: size.width * (animation1.value + .1),
              child: CustomPaint(
                painter: MyPainter(60),
              ),
            ),
            Positioned(
              top: size.height * .1,
              left: size.width * .8,
              child: CustomPaint(
                painter: MyPainter(animation4.value),
              ),
            ),
            SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: formKey,
                child: Column(
                  children: [
                    // Expanded(
                    // flex: 5,
                    // child:
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: size.height * .1),
                      child: const Text(
                        'Institute',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          wordSpacing: 4,
                        ),
                      ),
                    ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          component1(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "* Required";
                                } else {
                                  return null;
                                }
                              },
                              autofocus: true,
                              focusNode: userFocus,
                              onFieldSubmitted: (t) {
                                userFocus.unfocus();
                                passFocus.requestFocus();
                              },
                              maxLength: 10,
                              textInputAction: TextInputAction.next,
                              controller: usercontroll,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 20),
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                counterText: '',
                                hoverColor: Colors.transparent,
                                fillColor: Colors.transparent,
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.account_circle_rounded,
                                  color: Colors.white.withOpacity(.7),
                                ),
                                border: InputBorder.none,
                                hintMaxLines: 1,
                                hintText: ' Phone Number',
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(.5)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // component1(
                          //     Icons.email_outlined, 'Email...', false, true),
                          // const SizedBox(height: 20),
                          component1(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "* Required";
                                } else {
                                  return null;
                                }
                              },
                              focusNode: passFocus,
                              controller: passcontroll,
                              onFieldSubmitted: (t) {
                                passFocus.unfocus();
                                loginFocus.requestFocus();
                              },
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.8),
                                  fontSize: 20),
                              cursorColor: Colors.white,
                              obscureText: !isvisible,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isvisible = !isvisible;
                                    });
                                  },
                                  icon: (isvisible)
                                      ? const Icon(Icons.visibility,
                                          color: Colors.white)
                                      : const Icon(Icons.visibility_off,
                                          color: Colors.white),
                                ),
                                fillColor: Colors.transparent,
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.white.withOpacity(.7),
                                ),
                                border: InputBorder.none,
                                hintMaxLines: 1,
                                hintText: ' Password....',
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(.5)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  component2(
                                    text: 'LOGIN',
                                    voidCallback: () async {
                                      if (formKey.currentState!.validate()) {
                                        await logincontroll.login(
                                            number: usercontroll.text,
                                            password: passcontroll.text);
                                      } else {
                                        Get.snackbar(
                                          'User Name and Password Required',
                                          '',
                                          isDismissible: true,
                                          snackPosition: SnackPosition.BOTTOM,
                                          dismissDirection:
                                              SnackDismissDirection.HORIZONTAL,
                                        );
                                      }
                                    },
                                  ),
                                  SizedBox(width: size.width / 20),
                                  component2(
                                    text: 'Forgot Password',
                                    voidCallback: () {
                                      print('object');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 6,
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       component2(
                    //         'Create a new Account',
                    //         2,
                    //         () {
                    //           // HapticFeedback.lightImpact();
                    //           // Fluttertoast.showToast(
                    //           //     msg: 'Create a new account button pressed');
                    //         },
                    //       ),
                    //       SizedBox(height: size.height * .05),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget component1({required Widget child}) {
    // Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          // height: 100,
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: 400,
          alignment: Alignment.center,
          // padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: child,
        ),
      ),
    );
  }

  Widget component2({required String text, VoidCallback? voidCallback}) {
    // Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: voidCallback,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            height: 60,
            // width: 170,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              text,
              style: TextStyle(color: Colors.white.withOpacity(.8)),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
              colors: [Color(0xff75e6da), Color(0xff0e86d4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// class MyBehavior extends ScrollBehavior {
//   @override
//   Widget buildViewportChrome(
//       BuildContext context, Widget child, AxisDirection axisDirection) {
//     return child;
//   }
// }
