import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  StateMachineController getRiveController(Artboard artboard){
    StateMachineController? controller = StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return '';
                      }
                      return null;
                    },
                    onSaved: (email){},
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/icons/email.svg'),
                        )),
                  ),
                ),
                const Text(
                  'Password',
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                  child: TextFormField(
                    obscureText: true,
                    validator: (value){
                      if(value!.isEmpty){
                        return '';
                      }
                      return null;
                    },
                    onSaved: (password){},
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SvgPicture.asset('assets/icons/email.svg'),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                  child: ElevatedButton.icon(
                      onPressed: (){
                        setState(() {
                          isShowLoading = true;
                        });
                        if(_formKey.currentState!.validate()){

                        }else{

                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff77D8e),
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              )
                          )
                      ),
                      icon: const Icon(CupertinoIcons.arrow_right, color: Color(0xfffe0037),), label: const Text('Sign In')),
                )
              ],
            )),
        isShowLoading ? Positioned.fill(child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: 100,
              width: 100,
              child: RiveAnimation.asset('assets/RiveAssets/check.riv',
                onInit: (artBoard){
                StateMachineController controller = getRiveController(artBoard);
                check = controller.findSMI("check") as SMITrigger;
                error = controller.findSMI('error') as SMITrigger;
                reset = controller.findSMI('reset') as SMITrigger;
              },),
            ),
            const Spacer(),
          ],
        ),) : const SizedBox()
      ],
    );
  }
}
