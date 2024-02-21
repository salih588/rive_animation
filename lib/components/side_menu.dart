import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/info_card.dart';
import 'package:rive_animation/components/side_menu_tile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: "Abu Anwar",
                profession: "Youtuber",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, top: 32.0, bottom: 16.0, ),
                child: Text("Browse".toUpperCase(),style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70),),
              ),
              SideMenuTile()
            ],
          ),
        ),
      ),
    );
  }
}
