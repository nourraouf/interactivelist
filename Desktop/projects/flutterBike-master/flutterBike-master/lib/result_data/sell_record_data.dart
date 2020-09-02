import 'package:flutter/material.dart';
import 'package:shiref_bike/record/sellrecord.dart';
import 'package:shiref_bike/user/user_data.dart';

class selled_record extends StatelessWidget {
  final sell_recordd k;
  final user u;
  selled_record(this.k, this.u);

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

  Widget _product() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_product()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'product',
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _time() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        enabled: false,
        controller: TextEditingController(text: k.get_datatime()),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'datetime',
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
        u.get_id_image(),
        fit: BoxFit.fill,
      )),
    );
  }

  Widget _customer_data_user_image() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: GridTile(
          child: Image.network(
        u.get_user_image(),
        fit: BoxFit.fill,
      )),
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
            title: (Text("Sell Record Data")),
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
//international id&customer photo
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            // width: 190.0,
                            height: 240.0,
                            child: Column(
                              children: [
                                Image.network(
                                  u.get_user_image(),
                                  fit: BoxFit.fill,
                                ),
                                Text("Customer Photo")
                              ],
                            )),
                      ),
                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            width: 190.0,
                            height: 240.0,
                            child: Column(
                              children: [
                                Image.network(u.get_id_image(),
                                    fit: BoxFit.fill),
                                Text("Customer Intrnational ID")
                              ],
                            )),
                      ),
                    ],
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
              //price
              Container(
                  height: 70,
                  padding: EdgeInsets.all(2),
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Bike Price: ",
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
