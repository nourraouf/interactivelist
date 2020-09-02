import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shiref_bike/lists/main_list_for_rent.dart';
import 'package:shiref_bike/record/rentrecord.dart';
import 'package:shiref_bike/user/user_data.dart';

class rented_record extends StatelessWidget {
  final rent_recordd k;
  final main_bike b;
  final user uu;
  rented_record(this.k, this.b, this.uu);

  final _formkey = GlobalKey<FormState>();

  Widget _notes() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_notes()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'notes',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _price() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_price().toString()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'price',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _status() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_satus().toString()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'status',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _customer_data_user_idimage() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GridTile(
          child: Image.network(
        uu.get_id_image(),
        fit: BoxFit.fill,
      )),
    );
  }

  Widget _customer_data_user_image() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GridTile(
          child: Image.network(
        uu.get_user_image(),
        fit: BoxFit.fill,
      )),
    );
  }

  Widget _ends() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_ends()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'ends',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _bike() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: b.get_model()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'bike',
        ),
        maxLines: 2,
      ),
    );
  }

  final idholder = TextEditingController();
  final holder = TextEditingController();
  final rentholder = TextEditingController();
  final priceholder = TextEditingController();

  Widget _admin_name() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_admin_name()),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'admin name',
            icon: Icon(
              Icons.directions_bike,
              color: Colors.grey[700],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
        },
        child: Scaffold(
          appBar: AppBar(
            title: (Text("Rent")),
            backgroundColor: Colors.grey[800],
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
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Customer Data: ",
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
                  )),
              //international id&customer photo
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            height: 240.0,
                            child: Column(
                              children: [
                                Image.network(
                                  uu.get_user_image(),
                                  fit: BoxFit.fill,
                                ),
                                Text("Customer Photo")
                              ],
                            )),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            // width: 190.0,
                            height: 240.0,
                            child: Column(
                              children: [
                                Image.network(uu.get_id_image(),
                                    fit: BoxFit.fill),
                                Text("Customer Intrnational ID")
                              ],
                            )),
                      ),
                    ],
                  )),
              //Rent Cost
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rent Cost: ",
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
              //Statue
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Statue: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_satus().toString(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),

              //Bike Id
              Container(
                  height: 70,
                  padding: EdgeInsets.all(4),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Bike ID: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          k.get_id().toString(),
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  )),

              //ends
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Ends: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Due " + k.get_ends() + " days",
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

class search_for_bike {
  main_bike b;
  List<main_bike> all_bike = [];

  Future get_all_bikes() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    // final admin = prefs.getString('admin') ?? 0;
    print(token);
    final http.Response response = await http.get(
      'http://nabilmokhtar.pythonanywhere.com/apiBike/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "token $token"
      },
    );

    print(response.statusCode);

    var josendata = json.decode(response.body);
    for (var i in josendata) {
      main_bike u = main_bike(
          i["id"],
          i["model"],
          i["serial"],
          i["image"],
          i["availability"],
          i["rentability"],
          i["availabilityDuration"],
          i["description"],
          i["sellPrice"],
          i["rentPerDay"],
          i["rentPerWeek"],
          i["rentPerMonth"],
          i["branch"]);
      all_bike.add(u);
    }
  }

  search_for_bike() {
    get_all_bikes();
  }

  search(int id) {
    print("dedeafesfsef");

    print(all_bike.length);
    for (int i = 0; i < all_bike.length; i++) {
      if (all_bike[i].get_id() == id) {
        b = all_bike[i];
        break;
      }
    }
    if (b != null) {
      print(b.get_model());
      print(b.get_sell_price());
    }
  }
}

class get_user_data {
  List<user> users = [];
  user _us;

  Future get_users() async {
    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token') ?? 0;
    // final admin = prefs.getString('admin') ?? 0;
    print(token);
    final http.Response response = await http.get(
      'http://nabilmokhtar.pythonanywhere.com/User/User/',
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "token $token"
      },
    );
    print("${response.statusCode} ****************************");

    var josendata = json.decode(response.body);
    for (var i in josendata) {
      user u = new user(
        i['id'],
        i['name'],
        i['phone'],
        i['adress'],
        i['idImage'],
        i['userimage'],
      );
      users.add(u);
    }
  }

  get_user_data() {
    get_users();
  }
  search(int id) {
    print("dedeafesfsef");

    print(users.length);
    for (int i = 0; i < users.length; i++) {
      if (users[i].get_id() == id) {
        _us = users[i];
        get_user();
      }
    }
    if (_us != null) {
      print(_us.get_phone());
      print(_us.get_name());
    }
  }

  user get_user() {
    return _us;
  }
}
