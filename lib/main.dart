import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Maps(),
    );
  }
}


class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  List<Marker> allMarkers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: false,
      onTap: (){
        print("My Marker");
      },
      position: LatLng(21.121422, 79.047258)
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Gmaps"),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 800,
            width: 450,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(21.1214, 79.0472),
                zoom: 18,
                tilt: 25,
              ),
              markers: Set.from(allMarkers),
            ),
          ),
        ],
      ),
    );
  }
}
