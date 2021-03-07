import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          height: deviceSize.height * 0.25,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
          ),
          child: _previewImageUrl != null
              ? Image.network(_previewImageUrl)
              : const Text(
                  'No  Location Choosen',
                  textAlign: TextAlign.center,
                ),
        ),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.location_on,
                color: Theme.of(context).primaryColor,
              ),
              label: const Text(
                'Current Location',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.map_rounded,
                color: Theme.of(context).primaryColor,
              ),
              label: const Text(
                'Select on Map',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        )
      ],
    );
  }
}
