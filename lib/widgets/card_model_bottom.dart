import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/modal/colors.dart';

class Modelbottom extends StatefulWidget {
  const Modelbottom({
    super.key,
    required this.addTask,
  });
  final Function addTask;

  @override
  State<Modelbottom> createState() => _ModelbottomState();
}

class _ModelbottomState extends State<Modelbottom> {
  bool overlay = false;
  void _settime() {
    setState(() {
      overlay = !overlay;
    });
  }

  void handleonClick(BuildContext context) {
    final name = textValue;
    if (name.isEmpty) {
      return;
    }
    widget.addTask(name);
    Navigator.pop(context);
  }

  String textValue = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(111, 151, 151, 151),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (text) {
                            //thay doi gia tri textvalue bang text da nhap
                            textValue = text;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Your Task'),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _settime();
                          },
                          icon: Icon(
                            Icons.access_time,
                            size: 35,
                            color: Textcolor.getTextColor(isDarktheme),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Textcolor.getTextColor(isDarktheme),
                        ),
                        onPressed: () {
                          handleonClick(context);
                        },
                        child: const Text('Add Task')),
                  )
                ],
              ),
            ),
          ),
        ),
        if (overlay)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.9), // Màu xanh mờ
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'This is an overlay widget',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _settime();
                      }, // Đóng widget khi nhấn nút
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
