import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';
import 'components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10))),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const SizedBox(
                  width: 260,
                  child: Column(
                    children: [
                      Text(
                        'Learn design & code',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'Poppins',
                          height: 1.2,
                        ),
                      ),
                      Gap(16),
                      Text(
                          'Don\'t skip design. Learn design and code, by building real app with Flutter and Swift. Complete courses about the best tools.')
                    ],
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
                AnimatedBtn(
                  btnAnimationController: _btnAnimationController,
                  press: () {
                    _btnAnimationController.isActive = true;
                    customSigninDialog(context);
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                      'Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.'),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Future<Object?> customSigninDialog(BuildContext context) {
    return showGeneralDialog(
        barrierDismissible: true,
        barrierLabel: 'Sign In',
        context: context,
        pageBuilder: (context, _, __) => Center(
              child: Container(
                height: 620,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.94),
                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Sign In',
                            style:
                                TextStyle(fontSize: 34, fontFamily: 'Poppins'),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and swift.',
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SignInForm(),
                          const Row(
                            children: [
                              Expanded(child: Divider()),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  'OR',
                                  style: TextStyle(color: Colors.black26),
                                ),
                              ),
                              Expanded(child: Divider()),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Text(
                              'Sign up with Email, Apple or Google',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/email_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/apple_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: SvgPicture.asset(
                                  'assets/icons/google_box.svg',
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: -48,
                        child: const CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
