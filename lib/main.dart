import 'package:flutter/material.dart';
import 'package:todoapp/modal/item.dart';
import 'package:todoapp/widgets/card_body.dart';
import 'package:todoapp/widgets/card_model_bottom.dart';
import 'package:todoapp/widgets/control_page.dart';
import 'package:todoapp/modal/colors.dart';

bool isDarktheme = false; // Global Variables
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Dataitem> items = [];
  void _addhandleAddtask(String name) {
    final newItem = Dataitem(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItem);
    });
  }

  void deleteall() {
    setState(() {
      items.clear();
    });
  }

  void _hanldeDelete(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  void set_theme() {
    setState(() {
      isDarktheme = !isDarktheme;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ControlPage(
                              dele: deleteall,
                              theme: set_theme,
                            )));
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
        title: const Text(
          'ToDoList',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        backgroundColor: Appbarcolor.getAppbarColor(isDarktheme),
        centerTitle: true,
      ),
      body: items.isEmpty
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: BackgroundColors.getBackgroundColor(isDarktheme),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      'What do you want to do today?',
                      style: TextStyle(
                        color: Textcolor.getTextColor(isDarktheme),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'press + to add your task',
                      style: TextStyle(
                        color: Textcolor.getTextColor(isDarktheme),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              height: double.infinity,
              color: BackgroundColors.getBackgroundColor(isDarktheme),
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: items
                      .map((item) => Cardbody(
                            ten: item,
                            idd: _hanldeDelete,
                          ))
                      .toList(),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Modelbottom(addTask: _addhandleAddtask);
            },
          );
        },
        backgroundColor: Textcolor.getTextColor(isDarktheme),
        child: Icon(
          Icons.add,
          size: 40,
          color: BackgroundColors.getBackgroundColor(isDarktheme),
        ),
      ),
    );
  }
}
