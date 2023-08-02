import 'package:flutter/material.dart';

import '../../modals/global.dart';

class Page_view extends StatefulWidget {
  const Page_view({Key? key}) : super(key: key);

  @override
  State<Page_view> createState() => _Page_viewState();
}

class _Page_viewState extends State<Page_view> {
  PageController pageController = PageController(initialPage: 1);
  int i = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (val) {
          i = val;
        },
        controller: pageController,
        children: Global.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: Global.buttons
            .map((e) => BottomNavigationBarItem(
                  icon: e['icon'],
                  label: e['label'],
                ))
            .toList(),
        onTap: (val) {
          setState(() {
            i = val;
            pageController.jumpToPage(val);
          });
        },
        currentIndex: i,
        selectedItemColor: Color(0xff283c86),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
