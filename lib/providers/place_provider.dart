import 'package:flutter/foundation.dart';
import 'package:place_locator/helpers/db_helpers.dart';
import 'package:place_locator/models/place.dart';
import 'dart:io';

class PlaceProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: null,
    );

    _items.add(newPlace);
    notifyListeners();

    DBHelpers.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetData() async {
    final dataList = await DBHelpers.fetchData('user_places');
    _items = dataList
        .map((items) => Place(
              id: items['id'],
              title: items['title'],
              location: null,
              image: File(items['image']),
            ))
        .toList();
  }
}
