import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/screens/attendence_page.dart';
import '../views/screens/report_page.dart';
import '../views/screens/site_page.dart';
import '../views/screens/team_page.dart';

class Global {
  static final List<Map<String, dynamic>> dropDownItem = [
    {
      'sign': '%',
      'name': 'percent',
      'work': Slider(
        value: 0,
        onChanged: (val) {},
        min: 0,
        max: 1000,
      )
    },
    {
      'sign': 'sqm',
      'name': 'square meter',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.red,
      )
    },
    {
      'sign': 'm',
      'name': 'meter',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      )
    },
    {
      'sign': 'nos',
      'name': 'number',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.yellow,
      )
    },
    {
      'sign': 'sqft',
      'name': 'square feet',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.orange,
      )
    },
    {
      'sign': 'ft',
      'name': 'feet',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.blueGrey,
      )
    },
    {
      'sign': 'yd',
      'name': 'yard',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.teal,
      )
    },
    {
      'sign': 'km',
      'name': 'kilometer',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.brown,
      )
    },
    {
      'sign': 'gal',
      'name': 'gallons',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.grey,
      )
    },
    {
      'sign': 'cum',
      'name': 'cubic meter',
      'work': Container(
        height: 100,
        width: 100,
        color: Colors.green,
      )
    },
  ];
  static List<Widget> pages = [
    const Report(),
    const SitePage(),
    const Attendance(),
    const Material(),
    const Team()
  ];
  static List buttons = [
    {
      'icon': Icon(
        Icons.note_outlined,
        color: Colors.grey,
      ),
      'label': 'Report'
    },
    {
      'icon': Icon(
        Icons.note_alt_outlined,
        color: Colors.grey,
      ),
      'label': 'Site Plan'
    },
    {
      'icon': Icon(
        Icons.people_outline,
        color: Colors.grey,
      ),
      'label': 'Attendance'
    },
    {
      'icon': Icon(
        Icons.fire_truck_outlined,
        color: Colors.grey,
      ),
      'label': 'Material'
    },
    {
      'icon': Icon(
        CupertinoIcons.person_3,
        color: Colors.grey,
      ),
      'label': 'Team'
    },
  ];
}
