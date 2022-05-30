import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreLocator extends StatefulWidget {
  const StoreLocator({Key? key}) : super(key: key);

  @override
  State<StoreLocator> createState() => _StoreLocatorState();
}

class _StoreLocatorState extends State<StoreLocator> {
   final Set<Marker> _marker = {};

  void _onMapCreated(GoogleMapController controller){
    setState((){
      _marker.add(
         const Marker(
          markerId: MarkerId("id-1"),
          position: LatLng(45.491390, -73.584590),
          infoWindow: InfoWindow(
            title: "Zeta Fashions",
            snippet: "A Fashion Store",
          )
        )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        title: const Text("Store Locations", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body:  GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _marker,
        initialCameraPosition: const CameraPosition(
          target: LatLng(45.491390, -73.584590),
              zoom: 15,
        ),
      ),
    );
  }
}
