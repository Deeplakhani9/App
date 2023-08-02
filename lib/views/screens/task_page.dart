import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../modals/global.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final ImagePicker picker = ImagePicker();
  XFile? photo;
  File? image;

  bool buttonTap = false;
  bool attendanceTap = false;
  bool remarkTap = false;
  @override
  Widget build(BuildContext context) {
    Map dropDownValue = Global.dropDownItem.first;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Add/Update Work",
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Task Name",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "E.g - Civil ,Electrical,Painting Etc"),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Work Done Today",
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 1,
                                spreadRadius: 1,
                                color: Colors.grey)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "${dropDownValue['sign']}(${dropDownValue['name']}) ⇩️",
                      ),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                          builder: (context) {
                            return BottomSheet(onClosing: () {
                              Navigator.of(context).pop();
                            }, builder: (context) {
                              return Container(
                                height: 500,
                                color: Colors.white,
                                width: double.infinity,
                                child: ListView(
                                  children: Global.dropDownItem
                                      .map((e) => ListTile(
                                            title: Text(e['sign']),
                                            trailing: Text(e['name']),
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .vertical(
                                                    top: Radius.circular(20),
                                                  )),
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 30,
                                                          right: 10,
                                                          left: 10,
                                                          bottom: MediaQuery.of(
                                                                  context)
                                                              .viewInsets
                                                              .bottom),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .arrow_back)),
                                                              const Text(
                                                                "Total Work",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              const Spacer(),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .close_outlined))
                                                            ],
                                                          ),
                                                          TextFormField(
                                                            decoration:
                                                                InputDecoration(
                                                                    border:
                                                                        const OutlineInputBorder(),
                                                                    suffixText:
                                                                        e['sign']),
                                                            autofocus: true,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                horizontal: 180,
                                                              )),
                                                              child: const Text(
                                                                  "save"))
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                          ))
                                      .toList(),
                                ),
                              );
                            });
                          },
                          context: context);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.teal,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Add Photos (Optional)",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                alignment: const Alignment(0.5, 0.1),
                children: [
                  Container(
                    height: 80,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffAACBF1).withOpacity(0.5)),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    title: const Text(
                                      "Select photos from ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close_outlined),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      photo = await picker.pickImage(
                                          source: ImageSource.camera);
                                      setState(() {
                                        image = File(photo!.path);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor:
                                              const Color(0xffAACBF1)
                                                  .withOpacity(0.3),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Color(0xff283c86),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text(
                                          "Camera",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: Colors.grey,
                                    indent: 70,
                                  ),
                                  const Divider(
                                    color: Colors.transparent,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      photo = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        image = File(photo!.path);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor:
                                              const Color(0xffAACBF1)
                                                  .withOpacity(0.3),
                                          child: const Icon(
                                            Icons.photo,
                                            color: Color(0xff283c86),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Text(
                                          "Gallery",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    mini: true,
                    backgroundColor: const Color(0xff283c86),
                    child: const Icon(Icons.add),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              (buttonTap == false)
                  ? OutlinedButton(
                      onPressed: () {
                        setState(() {
                          buttonTap = true;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xff283c86),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xff283c86)),
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text("more"),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Work Categories"),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "General",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.keyboard_arrow_down),
                              )),
                        ),
                        (attendanceTap == false)
                            ? Row(
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        attendanceTap = true;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        foregroundColor: Color(0xff283c86)),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.person_add_alt_1,
                                          size: 18,
                                        ),
                                        Text("  Attendance"),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      setState(() {
                                        attendanceTap = true;
                                      });
                                    },
                                    style: OutlinedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        foregroundColor: Color(0xff283c86)),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.message_outlined,
                                          size: 18,
                                        ),
                                        Text("  Remark"),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Attendance (Optional)"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text("Skilled Workers"),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "Enter Attendance"),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Unskilled Workers"),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "Enter attendance"),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  (remarkTap == false)
                                      ? OutlinedButton(
                                          onPressed: () {
                                            setState(() {
                                              remarkTap = true;
                                            });
                                          },
                                          style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              foregroundColor:
                                                  Color(0xff283c86)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: const [
                                              Icon(
                                                Icons.message_outlined,
                                                size: 18,
                                              ),
                                              Text("  Remark"),
                                            ],
                                          ),
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Remark (Optional)"),
                                            TextFormField(
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: "Add Remark",
                                              ),
                                              maxLength: 3,
                                            )
                                          ],
                                        )
                                ],
                              )
                      ],
                    ),
              SizedBox(
                height: 80,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 150)),
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
