import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/home/home_screen.dart';
import 'package:rive_animation/utils/rive_utils.dart';

import 'components/animated_bar.dart';
import 'models/rive_asset.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {

  RiveAsset selectedBottomNav = bottomNavs.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ...List.generate(bottomNavs.length, (index) => GestureDetector(
              onTap: (){
                bottomNavs[index].input!.change(true);
                if(bottomNavs[index] != selectedBottomNav){
                  setState(() {
                    selectedBottomNav = bottomNavs[index];
                  });
                }
                Future.delayed(const Duration(seconds: 1),(){
                  bottomNavs[index].input!.change(false);
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedBar(isActive: bottomNavs[index] == selectedBottomNav),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Opacity(
                      opacity: bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                      child: RiveAnimation.asset(bottomNavs.first.src, artboard: bottomNavs[index].artBoard, onInit: (artBoard){
                        StateMachineController controller = RiveUtils.getRiveController(artBoard, stateMachineName: bottomNavs[index].stateMachineName);
                        bottomNavs[index].input = controller.findSMI('active') as SMIBool;
                      },),
                    ),),
                ],
              ),
            ),)
          ],),
        ),
      ),
    );
  }
}
