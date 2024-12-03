import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF075E54),
            title: Text(
              'WhatsApp',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
                color: Colors.white,
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
                color: Colors.white,
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.greenAccent[400],
              indicatorWeight: 5.0,
              labelPadding: EdgeInsets.all(10.0),
              tabs: <Widget>[
                Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                Text(
                  'CHAT',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'STATUS',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'PANGGILAN',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: Text('camera')),
              ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIlRY_QR4Z11GUL37bP4Il-qmPuk-383wd2A&s'))),
                title: Text('Coach Justin'),
                subtitle: Text('P, KKS Calling'),
                trailing: Text(
                  '22.30',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
              
              Center(child: Text('Status')),
              ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIlRY_QR4Z11GUL37bP4Il-qmPuk-383wd2A&s'))),
                title: Text('Coach Justin'),
                subtitle: Row(
                  children: <Widget>[
                    Icon(Icons.arrow_back, size: 16.0, color: Colors.green),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text('Kemarin 02.50')),
                  ],
                ),
                trailing: Icon(Icons.call, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}