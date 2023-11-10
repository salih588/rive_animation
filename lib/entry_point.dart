import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/utils/rive_utils.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {

  late SMIBool searchTrigger;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24))
          ),
          child: Row(
            children: [
            GestureDetector(
              onTap: (){
                searchTrigger.change(true);
              },
              child: SizedBox(
                height: 36,
                  width: 36,
                  child: RiveAnimation.asset("assets/RiveAssets/icons.riv", artboard: 'SEARCH', onInit: (artBoard){
                    StateMachineController controller = RiveUtils.getRiveController(artBoard, stateMachineName: 'SEARCH_Interactivity');
                    searchTrigger = controller.findSMI('active') as SMIBool;
                  },),),
            )
          ],),
        ),
      ),
    );
  }
}
