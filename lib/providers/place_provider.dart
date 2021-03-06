import 'package:flutter/foundation.dart';
import 'package:place_locator/models/place.dart';

class PlaceProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
