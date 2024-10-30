import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/modal/colors.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({
    super.key,
    required this.dele,
    required this.theme,
  });
  final Function theme;
  final Function dele;

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Appbarcolor.getAppbarColor(isDarktheme),
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BackgroundColors.getBackgroundColor(isDarktheme),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  if (await confirm(context)) {
                    return widget.dele();
                  }
                  return print('pressCancel');
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xffDFDFDF),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Delete all task',
                        style: TextStyle(
                            color: Color(0xff4B4b4b),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  widget.theme();
                  setState(() {});
                  //Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 70,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: const Color(0xffDFDFDF),
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Change Theme',
                        style: TextStyle(
                            color: Color(0xff4B4b4b),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
