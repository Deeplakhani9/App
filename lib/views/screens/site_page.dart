import 'package:flutter/material.dart';

class SitePage extends StatefulWidget {
  const SitePage({Key? key}) : super(key: key);

  @override
  State<SitePage> createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/task.png"),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "No Task found",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('task_page');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff283c86)),
                child: const Text("Create Task"))
          ],
        ),
      ),
    );
  }
}
