import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Sites",
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              height: 20,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffD5FBDF).withOpacity(0.5),
              ),
              child: const Text(
                "▶️ Help",
                style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff0B7A2A),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.circle,
                color: Color(0xff283c86),
                size: 35,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.5,
                        blurRadius: 2,
                        color: Colors.grey.shade300),
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: const Text("✨ Enter invite code to join project"),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffAACBF1).withOpacity(0.3)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/c_logo.png",
                            height: 50,
                            width: 50,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 200,
                            child: const Text(
                              "See how Construction Site can help your business?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff283c86),
                              padding: EdgeInsets.symmetric(horizontal: 90)),
                          onPressed: () {},
                          child: Text("Take your Tour"))
                    ],
                  ),
                )),
            Spacer(
              flex: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('create_site');
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff283c86))),
                child: Text(
                  "+ Create New Site",
                  style: TextStyle(color: Color(0xff283c86)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
