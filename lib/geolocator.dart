import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class geoLocator extends StatefulWidget {
  const geoLocator({super.key});

  @override
  State<geoLocator> createState() => _geoLocatorState();
}

class _geoLocatorState extends State<geoLocator> {
  Position? currentLocation;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Location : $currentLocation'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  currentLocation = await _determinePosition();
                  setState(() {

                  });
                },
                child: Text('Get Location'))
          ],
        ),
      ),
    );
  }
}




