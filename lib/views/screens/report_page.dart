import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String work = 'today';
  String selDate = '';
  String selMonth = '';

  bool rowTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("surat"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Report for",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(children: [
                    Radio(
                        activeColor: Color(0xff283c86),
                        value: 'today',
                        groupValue: work,
                        onChanged: (val) {
                          setState(() {
                            work = val!;
                          });
                        }),
                    Text("Today")
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Color(0xff283c86),
                        value: '7day',
                        groupValue: work,
                        onChanged: (val) {
                          setState(() {
                            work = val!;
                          });
                        }),
                    Text("7 Days")
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Color(0xff283c86),
                        value: '15day',
                        groupValue: work,
                        onChanged: (val) {
                          setState(() {
                            work = val!;
                          });
                        }),
                    Text("15 Days")
                  ]),
                  Row(children: [
                    Radio(
                        activeColor: Color(0xff283c86),
                        value: 'Specific',
                        groupValue: work,
                        onChanged: (val) {
                          setState(() {
                            work = val!;
                          });
                        }),
                    Text("Specific Day")
                  ]),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("FROM"),
                    GestureDetector(
                      onTap: () async {
                        DateTime? data = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        );
                        if (data!.month == 1) {
                          selMonth = 'Jan';
                        } else if (data.month == 2) {
                          selMonth = 'Feb';
                        } else if (data.month == 3) {
                          selMonth = 'March';
                        } else if (data.month == 4) {
                          selMonth = 'April';
                        } else if (data.month == 5) {
                          selMonth = 'May';
                        } else if (data.month == 6) {
                          selMonth = 'June';
                        } else if (data.month == 7) {
                          selMonth = 'July';
                        } else if (data.month == 8) {
                          selMonth = 'Aug';
                        } else if (data.month == 9) {
                          selMonth = 'Sep';
                        } else if (data.month == 10) {
                          selMonth = 'Oct';
                        } else if (data.month == 11) {
                          selMonth = 'Nov';
                        } else if (data.month == 12) {
                          selMonth = 'Dec';
                        }
                        setState(() {
                          selDate = "${selMonth} ${data.day},${data.year}";
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text(selDate), Icon(Icons.calendar_today)],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To"),
                    GestureDetector(
                      onTap: () async {
                        DateTime? data = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2050),
                        );
                        if (data!.month == 1) {
                          selMonth = 'Jan';
                        } else if (data.month == 2) {
                          selMonth = 'Feb';
                        } else if (data.month == 3) {
                          selMonth = 'March';
                        } else if (data.month == 4) {
                          selMonth = 'April';
                        } else if (data.month == 5) {
                          selMonth = 'May';
                        } else if (data.month == 6) {
                          selMonth = 'June';
                        } else if (data.month == 7) {
                          selMonth = 'July';
                        } else if (data.month == 8) {
                          selMonth = 'Aug';
                        } else if (data.month == 9) {
                          selMonth = 'Sep';
                        } else if (data.month == 10) {
                          selMonth = 'Oct';
                        } else if (data.month == 11) {
                          selMonth = 'Nov';
                        } else if (data.month == 12) {
                          selMonth = 'Dec';
                        }
                        setState(() {
                          selDate = "${selMonth} ${data.day},${data.year}";
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 170,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text(selDate), Icon(Icons.calendar_today)],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black,
              height: 2,
            ),
            (rowTap)
                ? Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            rowTap = !rowTap;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Parts in the Report"),
                            Icon(Icons.keyboard_arrow_up_sharp)
                          ],
                        ),
                      ),
                      Text("hiiiii")
                    ],
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        rowTap = true;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Parts in the Report"),
                        Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
