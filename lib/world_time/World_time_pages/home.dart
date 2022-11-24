import 'dart:developer';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings?.arguments as Map;
    print(data);

    //set background image

    final String bgImage =
        (data['isDayTime']) ? 'day.png' : 'night.png';
    log(bgImage);
    final Color? bgColor =
        (data['isDayTime']) ? Colors.blue : Colors.red[700];

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('./assets/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () {Navigator.pop(context);},
                    icon: Icon(Icons.exit_to_app_outlined),
                    label: Text('Exit')),
                TextButton.icon(
                    label: const Text(
                      'Edit location',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.edit_location,
                      color: Colors.white,
                    ),
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag']
                        };
                      });
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          data['location'],
                          style: const TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(fontSize: 66.0, color: Colors.white),
                )
              ],
            ),
          ),
        )));
  }
}
