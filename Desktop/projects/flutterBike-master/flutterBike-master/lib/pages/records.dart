import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:intl/intl.dart';
import 'package:shiref_bike/record/fixrecord.dart';
import 'package:shiref_bike/record/rentrecord.dart';
import 'package:shiref_bike/record/sellrecord.dart';
import 'package:shiref_bike/result_data/fix_record_data.dart';
import 'package:shiref_bike/result_data/rent_record_data.dart';
import 'package:shiref_bike/result_data/sell_record_data.dart';
import 'package:shiref_bike/widgets/shared.dart';

import 'edits_bike.dart';
import 'home.dart';

class state_record extends StatelessWidget {
  fix_record fix = new fix_record();
  sell_record sell = new sell_record();
  rent_record rent = new rent_record();
  search_for_bike b = new search_for_bike();
  get_user_data u = new get_user_data();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Records"),
      body: Container(
        child: new ListView.builder(
            itemCount: fix.fix_records.length +
                sell.sell_records.length +
                rent.rent_records.length,
            itemBuilder: (BuildContext context, int index) =>
                buildTripCard(context, index)),
      ),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    //rent
    if (index < rent.rent_records.length) {
      var recod = rent.rent_records[index];
      return new GestureDetector(
        onTap: () {
          b.search(recod.get_main_bike());
          u.search(recod.get_customer());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return rented_record(recod, b.b, u.get_user());
          }));
        },
        child: Container(
          height: 100,
          child: SingleChildScrollView(
            child: Card(
              elevation: 0.7,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(children: <Widget>[
                        Icon(
                          Icons.payment,
                          size: 35,
                          color: Colors.grey[600],
                        ),
                        Spacer(),
                        Text(
                          "Process type:",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Text(
                          "Rent",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.lightGreen[500],
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Text(
                          "Admin name: ",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          recod.get_admin_name(),
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.contacts),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Text(
                            "Price: ",
                            style: new TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            recod.get_price().toString(),
                            style: new TextStyle(fontSize: 15.0),
                          ),
                          Icon(Icons.attach_money),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Text(
                            "End Date:${recod.get_ends()}",
                            style: new TextStyle(fontSize: 15.0),
                          ),
                          Spacer(),
                          Icon(Icons.date_range),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      //sell
    } else if (index >= rent.rent_records.length &&
        index < rent.rent_records.length + sell.sell_records.length) {
      var recod = sell.sell_records[index - rent.rent_records.length];

      return new GestureDetector(
        onTap: () {
          u.search(recod.get_customer());
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return selled_record(recod, u.get_user());
          }));
        },
        child: Container(
          child: SingleChildScrollView(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(children: <Widget>[
                        Icon(
                          Icons.motorcycle,
                          size: 35,
                          color: Colors.grey[600],
                        ),
                        Spacer(),
                        Text(
                          "Process type: ",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sell",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.lightGreen[500],
                              fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Text(
                          "Admin Name: ",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          recod.get_admin_name(),
                          style:
                              TextStyle(color: Colors.grey[700], fontSize: 15),
                        ),
                        Spacer(),
                        Icon(Icons.contacts),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                      child: Row(
                        children: <Widget>[
                          Spacer(),
                          Text(
                            "Price: ",
                            style: new TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                          Text(recod.get_price().toString()),
                          Icon(Icons.attach_money),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Spacer(),
                          Text(
                            "Date: ${recod.get_datatime().substring(0, 10)}",
                            style: new TextStyle(fontSize: 15.0),
                          ),
                          Spacer(),
                          Icon(Icons.date_range),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else if (index >= rent.rent_records.length + sell.sell_records.length &&
        index <
            rent.rent_records.length +
                sell.sell_records.length +
                fix.fix_records.length) {
      var recod = fix.fix_records[
          index - sell.sell_records.length - rent.rent_records.length];
      return new GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return fixed_record(recod);
          }));
        },
        child: Container(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(children: <Widget>[
                      Icon(
                        Icons.build,
                        size: 35,
                        color: Colors.grey[600],
                      ),
                      Text(
                        "Process type: ",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Fix",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.lightGreen[500],
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Spacer(),
                      Text(
                        "Admin Name: ",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        recod.get_admin_name(),
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                      Spacer(),
                      Icon(Icons.contacts),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Price: ",
                          style: new TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(recod.get_price().toString()),
                        Icon(Icons.attach_money),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
