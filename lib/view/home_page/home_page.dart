import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/controller/homepage_controller.dart';
import 'package:todo_app/utils/color_constants/color_constants.dart';
import 'package:todo_app/view/home_page/widgets/customradiobuttons.dart';
import 'package:todo_app/view/home_page/widgets/todolistpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Homepagecontroller saveobj = Homepagecontroller();
  // Homepagecontroller deleteobj = Homepagecontroller();
  var mybox = Hive.box('todobox');
  @override
  void initState() {
    saveobj.init();
    saveobj.notekeys = mybox.keys.toList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstants.mainblack,
      appBar: AppBar(
        title: Text(
          "To Do",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
        // centerTitle: true,
        backgroundColor: Colorconstants.mainblack,
      ),
      body: saveobj.notekeys.isEmpty
          ? Center(
              child: Text(
                "no task found",
                style: TextStyle(color: Colorconstants.mainwhite),
              ),
            )
          : Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: ListView.separated(
                  // to reverse the ading
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    var element = mybox.get(saveobj.notekeys[index]);
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: custonotewidget(
                        title: element["title"],
                        des: element["des"],
                        // color: element["color"],
                        // delete
                        ondeletepressed: () {
                          saveobj.deleteData(index);
                          setState(() {});
                        },

                        // edit
                        oneditpressed: () {
                          Homepagecontroller.titlecontroller.text =
                              element["title"];
                          Homepagecontroller.descontroller.text =
                              element["des"];

                          // to show bottom sheet
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return ToDoListpage(
                                isedit: true,

                                onSavepressed: () {
                                  //
                                  saveobj.editData(index);

                                  setState(() {});
                                  Homepagecontroller.clearData();
                                  //
                                  Navigator.pop(context);
                                },
                                // end of bottom sheet
                              );
                            },
                          );

                          setState(() {});
                        },
                      ),

                      // custom note ends
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(),
                  itemCount: saveobj.notekeys.length),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ToDoListpage(
                onSavepressed: () {
                  saveobj.addData();

                  setState(() {});
                  Homepagecontroller.clearData();
                  //
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colorconstants.mainblack,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        mini: true,
      ),
    );
  }
}
