import 'package:flutter/material.dart';
import 'package:shiref_bike/record/fixrecord.dart';

class fixed_record extends StatelessWidget {
  final fix_recordd k;
  fixed_record(this.k);

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
        },
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: (Text("Fix")),
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
              //admin name
              Container(
                  height: 70.0,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Admin Name: ",
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          k.get_admin_name(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightGreen[500],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              //customer data
              Container(
                  height: 70.0,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Customer ID: ",
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(
                                k.get_customer().toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              //international id&customer photo
              // Container(
              //     color: Colors.white,
              //     padding: EdgeInsets.all(10),
              //     child: Row(
              //       children: <Widget>[
              //         Container(
              //             padding: EdgeInsets.all(5),
              //             width: 190.0,
              //             height: 240.0,
              //             child: Column(
              //               children: [
              //                 Image.network(
              //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzQePYsQbM019HHcpdaVH9sZgg5N34C62rSg&usqp=CAU'),
              //                 Text("Customer Photo")
              //               ],
              //             )),
              //         Container(
              //             padding: EdgeInsets.all(5),
              //             width: 190.0,
              //             height: 240.0,
              //             child: Column(
              //               children: [
              //                 Image.network(
              //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQzQePYsQbM019HHcpdaVH9sZgg5N34C62rSg&usqp=CAU'),
              //                 Text("Customer Intrnational ID")
              //               ],
              //             )),
              //       ],
              //     )),

              //Notes
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Notes: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_notes(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),
//price
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Price: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_price().toString(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
