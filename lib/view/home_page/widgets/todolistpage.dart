import 'package:flutter/material.dart';
import 'package:todo_app/controller/homepage_controller.dart';

class ToDoListpage extends StatefulWidget {
  const ToDoListpage({
    super.key,
    this.onSavepressed,
    this.isedit = false,
    //  this.oneditpressed
  });

  final void Function()? onSavepressed;
  final bool isedit;

  // final VoidCallback? oneditpressed;

  @override
  State<ToDoListpage> createState() => _ToDoListpageState();
}

class _ToDoListpageState extends State<ToDoListpage> {
  // TextEditingController titlecontroller = TextEditingController();
  // TextEditingController descontroller = TextEditingController();
  // TextEditingController datecontroller = TextEditingController();

  int selectedindex = 0;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Homepagecontroller valobj = Homepagecontroller();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, bottomsetstate) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(11))),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1st
                TextFormField(
                  controller: Homepagecontroller.titlecontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text(
                      "Subject",
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),

                  //  validation for not saving without entering
                  validator: (value) {
                    if (Homepagecontroller.titlecontroller.text.isNotEmpty) {
                      return null;
                    } else {
                      return "enter a valid title";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    // if (valobj.noteslist.isNotEmpty)
                    if (Homepagecontroller.descontroller.text.isNotEmpty) {
                      return null;
                    } else {
                      return "enter a valid des";
                    }
                  },
                  controller: Homepagecontroller.descontroller,
                  maxLines: 3,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text(
                      "Description",
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            widget.onSavepressed!();
                          }

                          // widget.onSavepressed!();
                          // to cleardata
                          // Homepagecontroller.clearData();
                          // Navigator.pop(context);
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Center(
                            child: Text(
                              widget.isedit ? "update" : "save",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Homepagecontroller.clearData();
                          //
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Center(
                            child: Text(
                              "cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
