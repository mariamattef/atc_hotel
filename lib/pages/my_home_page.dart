import 'package:android_atc_hotel_task11/pages/room_card.dart';
import 'package:flutter/material.dart';
import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? selectedInDate;
  DateTime? selectedoutDate;
  var adultNum = 0.0;
  var childNum = 0.0;
  bool seaCityView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        foregroundColor: Colors.white,
        title: const Text(
          'Android ATC Hotel',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/hotel.jpg',
                  width: 400,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'check-in Date : ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selectedInDate == null
                        ? Text(
                            '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}',
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 18),
                          )
                        : Text(
                            ' ${selectedInDate!.day} - ${selectedInDate!.month} - ${selectedInDate!.year}',
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 18),
                          ),
                    IconButton(
                        onPressed: () async {
                          var result = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030));

                          if (result != null) {
                            setState(() {
                              selectedInDate = result;
                            });
                          }
                        },
                        icon: const Icon(Icons.date_range),
                        color: Colors.deepOrangeAccent),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Check-out Date : ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selectedoutDate == null
                        ? Text(
                            '${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}',
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 18),
                          )
                        : Text(
                            ' ${selectedoutDate!.day} - ${selectedoutDate!.month} - ${selectedoutDate!.year}',
                            style: const TextStyle(
                                color: Colors.blue, fontSize: 18),
                          ),
                    IconButton(
                        onPressed: () async {
                          var result = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030));

                          if (result != null) {
                            setState(() {
                              selectedoutDate = result;
                            });
                          }
                        },
                        icon: const Icon(Icons.date_range),
                        color: Colors.deepOrangeAccent),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Adults : ' '$adultNum ',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Slider(
                        activeColor: Colors.blue,
                        value: adultNum,
                        onChanged: (value) {
                          setState(() {
                            adultNum = value;
                          });
                        },
                        min: 0,
                        max: 10,
                        divisions: 10,
                        label: adultNum.round().toString(),
                      ),
                    ),
                    Text(
                      adultNum.round().toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'children : ' '$childNum ',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Slider(
                        activeColor: Colors.blue,
                        value: childNum,
                        onChanged: (value) {
                          setState(() {
                            childNum = value;
                          });
                        },
                        min: 0,
                        max: 10,
                        divisions: 10,
                        // label: childNum.round().toString(),
                      ),
                    ),
                    Text(
                      childNum.round().toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Extras :',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FlutGroupedButtons(
                      labelStyle: const TextStyle(fontSize: 18),
                      titleCheckSpace: 15,
                      data: const [
                        'Breakfast (10 USD/Day)',
                        'Internet Wifi (5 USD/Day)',
                        'Parking (5 USD/Day)',
                        'Swimming Pool (10 USD/Day)',
                      ],
                      onChanged: (value) {
                        print(value);
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'View : ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            value: seaCityView,
                            onChanged: (value) {
                              setState(() {
                                seaCityView = !seaCityView;
                              });
                            },
                          ),
                          const Text('City View',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            value: seaCityView == false ? true : false,
                            onChanged: (value) {
                              seaCityView = !seaCityView;
                              setState(() {});
                            },
                          ),
                          const Text('Sea View',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      color: Colors.deepOrange,
                      child: Text(
                        'Check Rooms and Rates',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RoomCard()));
                      },
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// SizedBox(width: 10),
//                     Text(
//                       'Check-out Date',
//                       style: TextStyle(fontSize: 18),
//                     ),
