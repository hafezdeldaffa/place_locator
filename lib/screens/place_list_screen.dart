import 'package:flutter/material.dart';
import 'package:place_locator/providers/place_provider.dart';
import 'package:place_locator/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place List Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<PlaceProvider>(context).fetchAndSetData(),
        builder: (context, dataSnapshot) => dataSnapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<PlaceProvider>(
                child: Center(child: const Text('No data, please add some!')),
                builder: (context, placeData, child) =>
                    placeData.items.length <= 0
                        ? child
                        : ListView.builder(
                            itemCount: placeData.items.length,
                            itemBuilder: (context, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(placeData.items[index].image),
                              ),
                              title: Text(placeData.items[index].title),
                              onTap: () {
                                // go to detail page
                              },
                            ),
                          ),
              ),
      ),
    );
  }
}
