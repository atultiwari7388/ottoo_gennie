import 'package:flutter/material.dart';
import 'package:ottoo_gennie/src/Pages/drawer/drawer_ser.dart';
import 'package:ottoo_gennie/src/Services/store_location.dart';
import 'package:ottoo_gennie/src/widgets/image_slider.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        // backgroundColor: Colors.grey,
        appBar: AppBar(
            elevation: 1,
            centerTitle: true,
            backgroundColor: Colors.white,
            title: Text(
              'OTTOO GENNIE',
              style: TextStyle(color: Colors.red),
            ),
            iconTheme: IconThemeData(color: Colors.red)),
        drawer: DrawerSide(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StoreLocation()));
          },
          tooltip: 'Store Location',
          child: Icon(Icons.pin_drop_outlined),
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        body: Container(
          child: ListView(
            children: [
              ImageSlider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Our Services',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                // color: Colors.yellow,
                child: ListTile(
                  title: Text('General Auto Repair & Maintenance'),
                  leading: Image.asset('assets/Auto_repair.png'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                // color: Colors.yellow,
                child: ListTile(
                  title: Text('Brake Repair and Replacement'),
                  leading: Image.asset('assets/Brake_repair.png'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                // color: Colors.yellow,
                child: ListTile(
                  title: Text('AC Repair'),
                  leading: Image.asset('assets/air_condition.png'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                // color: Colors.yellow,
                child: ListTile(
                  title: Text('Tire Repair'),
                  leading: Image.asset('assets/Tire_repair.png'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                // color: Colors.yellow,
                child: ListTile(
                  title: Text('Fuel System Repair'),
                  leading: Image.asset('assets/Fuel_repair.png'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20))),
                // color: Colors.yellow,
                child: ListTile(
                  title: Text('Engine Cooling System Maintenance'),
                  leading: Image.asset('assets/Engine_cooling.png'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
