import 'package:rive/rive.dart';

class RiveAsset {
  final String artBoard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artBoard,
      required this.stateMachineName,
      required this.title,
      this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset('assets/RiveAssets/icons.riv',
      artBoard: 'CHAT', stateMachineName: 'CHAT_Interactivity', title: 'Chat'),
  RiveAsset('assets/RiveAssets/icons.riv',
      artBoard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
      title: 'Search'),
  RiveAsset('assets/RiveAssets/icons.riv',
      artBoard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
      title: 'Time'),
  RiveAsset('assets/RiveAssets/icons.riv',
      artBoard: 'BELL',
      stateMachineName: 'BELL_Interactivity',
      title: 'Notifications'),
  RiveAsset('assets/RiveAssets/icons.riv',
      artBoard: 'USER',
      stateMachineName: 'USER_Interactivity',
      title: 'Profile'),
];

List<RiveAsset> sideMenus = [
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "HOME",
    stateMachineName: "HOME_interactivity",
    title: "Home",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "SEARCH",
    stateMachineName: "SEARCH_Interactivity",
    title: "Search",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "LIKE/STAR",
    stateMachineName: "STAR_Interactivity",
    title: "Favorites",
  ),
  RiveAsset(
    "assets/RiveAssets/icons.riv",
    artBoard: "CHAT",
    stateMachineName: "CHAT_Interactivity",
    title: "Help",
  ),
];
