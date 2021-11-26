import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:imstitute/animation/login_animation.dart';
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
      backgroundColor: Colors.blue,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              top: size.height * .1,
              left: size.width * .8,
              child: CustomPaint(
                painter: MyPainter(animation4.value),
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
              top: (size.height * 0.3) * animation3.value,
              left: size.width * (animation1.value + .1),
              child: CustomPaint(
                painter: MyPainter(60),
              ),
            ),
            Positioned(
              top: size.height * (animation2.value + .55),
              left: size.width * .21,
              child: CustomPaint(
                painter: MyPainter(animation4.value - 120),
              ),
            ),
            Positioned(
              top: size.height * .6,
              left: size.width * (animation2.value + .8),
              child: CustomPaint(
                painter: MyPainter(animation4.value - 150),
              ),
            ),
            Positioned(
              bottom: size.height * (animation2.value + .1),
              right: size.width * (animation3.value - .1),
              child: CustomPaint(
                painter: MyPainter(60),
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
                      child: const FadeAnimation(
                        1,
                        Text(
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
                    ),
                    // ),
                    FadeAnimation(
                      1.2,
                      component1(
                        label: 'Phone Number',
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "* Required";
                            } else if (value.length < 10) {
                              return 'Enter Valid Phone Number';
                            } else if (!GetUtils.isNumericOnly(value)) {
                              return 'Invalid Number';
                            } else {
                              return null;
                            }
                          },
                          focusNode: userFocus,
                          onFieldSubmitted: (t) {
                            userFocus.unfocus();
                            passFocus.requestFocus();
                          },
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          controller: usercontroll,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            counterText: '',
                            hoverColor: Colors.transparent,
                            fillColor: Colors.transparent,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.white,
                            ),
                            errorStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                            border: InputBorder.none,
                            hintMaxLines: 1,
                            hintText: 'Enter Your Phone Number',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeAnimation(
                      1.4,
                      component1(
                        label: 'Password',
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          cursorColor: Colors.white,
                          obscureText: !isvisible,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hoverColor: Colors.transparent,
                            suffixIcon: IconButton(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {
                                setState(() {
                                  isvisible = !isvisible;
                                });
                              },
                              icon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                child: (isvisible)
                                    ? const Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                        key: Key('first'),
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: Colors.white,
                                        key: Key('second'),
                                      ),
                                transitionBuilder: (child, anim) {
                                  return SizeTransition(
                                    axis: Axis.vertical,
                                    child: child,
                                    sizeFactor: anim,
                                  );
                                },
                              ),
                            ),
                            fillColor: Colors.transparent,
                            filled: true,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            border: InputBorder.none,
                            hintMaxLines: 1,
                            hintText: 'Your Password....',
                            hintStyle: const TextStyle(
                              fontSize: 15,
                              color: Colors.white54,
                            ),
                            errorStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeAnimation(
                      1.6,
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
                            voidCallback: () {},
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

  Widget component1({required Widget child, required String label}) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
        Container(
          child: child,
          width: 450,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
        ),
      ],
    );
    // ClipRRect(
    //   borderRadius: BorderRadius.circular(15),
    //   child: BackdropFilter(
    //     filter: ImageFilter.blur(
    //       sigmaY: 15,
    //       sigmaX: 15,
    //     ),
    //     child: Container(
    //       // height: 100,
    //       padding: const EdgeInsets.symmetric(vertical: 10),
    //       width: 400,
    //       alignment: Alignment.center,
    //       // padding: EdgeInsets.only(right: size.width / 30),
    //       decoration: BoxDecoration(
    //         color: Colors.white.withOpacity(.09),
    //         borderRadius: BorderRadius.circular(15),
    //       ),
    //       child: child,
    //     ),
    //   ),
    // );
  }

  Widget component2({required String text, VoidCallback? voidCallback}) {
    // Size size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: voidCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white.withOpacity(.8)),
        ),
      ),
    );
    // ClipRRect(
    //   borderRadius: BorderRadius.circular(15),
    //   child: BackdropFilter(
    //     filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
    //     child: InkWell(
    //       highlightColor: Colors.transparent,
    //       splashColor: Colors.transparent,
    //       onTap: voidCallback,
    // child: Container(
    //   padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    //   height: 60,
    //   // width: 170,
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(
    //     color: Colors.white.withOpacity(.05),
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: Text(
    //     text,
    //     style: TextStyle(color: Colors.white.withOpacity(.8)),
    //   ),
    // ),
    //     ),
    //   ),
    // );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white38;
    // ..shader = const LinearGradient(
    //         colors: [Color(0xff75e6da), Color(0xff0e86d4)],
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight)
    //     .createShader(Rect.fromCircle(
    //   center: const Offset(0, 0),
    //   radius: radius,
    // ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
