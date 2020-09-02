import 'package:flutter/material.dart';
import 'package:shiref_bike/result_data/rented_bike_data.dart';

class data_bike_customer extends StatelessWidget {
  int id;
  String name;
  String image;

  data_bike_customer(int id, String name, String image) {
    this.id = id;
    this.name = name;
    this.image = image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: (Text("Customer Data")),
        backgroundColor: Colors.grey[700],
        leading: new IconButton(
          icon: new Icon(
            Icons.arrow_back,
            color: Colors.lightGreen[500],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          //customer id
          Container(
              height: 70.0,
              padding: EdgeInsets.all(2),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Text(
                      "International ID: ",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      id.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.lightGreen[500],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),

          //international id&customer photo
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(5),
                      width: 190.0,
                      height: 240.0,
                      child: Column(
                        children: [
                          Image.network(image),
                          Text("Customer Photo")
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.all(5),
                      width: 190.0,
                      height: 240.0,
                      child: Column(
                        children: [
                          Image.network(image),
                          Text("Customer Intrnational ID")
                        ],
                      )),
                ],
              )),

          //name
          Container(
              height: 70,
              padding: EdgeInsets.all(2),
              child: Card(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Name: ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      name,
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
