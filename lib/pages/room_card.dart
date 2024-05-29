import 'dart:ui';

import 'package:android_atc_hotel_task11/model/room_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoomCard extends StatefulWidget {
  // Room? room;
  RoomCard({super.key});

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class Room {
  bool isExpanded;
  final Widget header;
  final String selection;
  final String body;
  Room(
    this.isExpanded,
    this.header,
    this.selection,
    this.body,
  );
}

class _RoomCardState extends State<RoomCard> {
  List<Room> rooms = <Room>[
    Room(
        true,
        Container(
          child: const Image(
            height: 100,
            width: 200,
            image: AssetImage('assets/1.jpg'),
          ),
        ),
        "King Room",
        "A room with a king-sized bed."),
    Room(
        false,
        Container(
          child: const Image(
            height: 100,
            width: 200,
            fit: BoxFit.contain,
            image: AssetImage('assets/2.jpg'),
          ),
        ),
        "Double Room",
        "A room assigned to two people."),
    Room(
        false,
        Container(
          child: const Image(
            height: 100,
            width: 200,
            fit: BoxFit.contain,
            image: AssetImage(
              'assets/3.jpg',
            ),
          ),
        ),
        "Family Room",
        "A room assigned to two people."),
  ];

  @override
  Widget build(BuildContext context) {
    ListView List_Criteria;
    List_Criteria = ListView(
      children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ExpansionPanelList(
            expandIconColor: Colors.orangeAccent,
            elevation: 1,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                rooms[index].isExpanded = !rooms[index].isExpanded;
              });
            },
            children: rooms.map(
              (Room room) {
                return ExpansionPanel(
                  backgroundColor: Color.fromARGB(255, 245, 218, 184),
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                        minVerticalPadding: 10,
                        splashColor: Colors.orange,
                        contentPadding: EdgeInsets.all(5),
                        shape: ShapeBorder.lerp(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            1.0),
                        leading: room.header,
                        style: ListTileStyle.drawer,
                        title: Text(
                          room.selection,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        ));
                  },
                  isExpanded: room.isExpanded,
                  body: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      room.body,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        )
      ],
    );
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.orangeAccent,
        title: Text(
          "Rooms List",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: List_Criteria,
      persistentFooterButtons: <Widget>[
        ButtonBar(children: <Widget>[
          MaterialButton(
            color: Colors.orange,
            child: Text(
              'Next',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
        ]),
      ],
    );
    return scaffold;
  }
}
