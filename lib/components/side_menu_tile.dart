import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Divider(color: Colors.white24, height: 1,),
        ),
        ListTile(
          onTap: (){},
          leading: SizedBox(
            height: 34,
            width: 34,
            child: RiveAnimation.asset("assets/RiveAssets/icons.riv", artboard: "HOME", onInit: (artBoard){},),
          ),
          title: const Text("Home", style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}