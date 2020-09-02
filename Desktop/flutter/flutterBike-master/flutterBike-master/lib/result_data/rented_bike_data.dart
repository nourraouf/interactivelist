import 'package:flutter/material.dart';
import 'package:shiref_bike/add_types/add_user.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:shiref_bike/result_data/customer_data.dart';
import 'package:shiref_bike/widgets/shared.dart';

import 'package:shiref_bike/lists/rented_list.dart';
import 'package:shiref_bike/pages/home.dart';
import '../main.dart';

class data_rented_bike extends StatelessWidget {
  final main_bike k;

  data_rented_bike(this.k);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: (Text(k.get_model())),
        backgroundColor: Colors.grey[700],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          color: Colors.lightGreen[500],
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          //image
          Container(
            padding: EdgeInsets.all(10),
            height: 300,
            child: GridTile(
                child: Image.network(
              k.get_image(),
              fit: BoxFit.fill,
            )),
          ),
          //details
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Text(
              "Details",
              style: TextStyle(fontSize: 30),
            ),
          ),
          Divider(
            color: Colors.transparent,
            thickness: 10,
          ),
          //name
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Bike Name: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    k.get_model(),
                    style:
                        TextStyle(fontSize: 15, color: Colors.lightGreen[500]),
                  ),
                ],
              )),
          // rent per day
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Rent Price per Day: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    k.get_per_day().toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              )),
          // rent per week
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Rent Price per Week: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    k.get_per_week().toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              )),

          // rent per month
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Rent Price per Month: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    k.get_per_month().toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              )),

          // price
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "Bike Price: ",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    k.get_sell_price().toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              )),

          //description
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: "Description: ",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                TextSpan(
                  text: k.get_description(),
                  style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                ),
              ]))),

          Divider(
            color: Colors.transparent,
            thickness: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60),
            child: Align(
              child: SizedBox(
                width: 290,
                height: 60,
                child: RaisedButton(
                  color: Colors.lightGreen[500],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Show Customer Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return data_bike_customer(12112, "sasasd", k.get_image());
                    }));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
