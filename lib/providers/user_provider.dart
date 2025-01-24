import 'package:evently/modals/user_modal.dart';
import 'package:flutter/material.dart';

import '../firebase_service.dart';

class UserProvider with ChangeNotifier {
  UserModal? currentUser;

  void updateCUrrrentUser(UserModal? user) {
    currentUser = user;
    notifyListeners();
  }

  bool checkIsEventFavourite(String eventId) {
   return currentUser!.favouriteEventsIds.contains(eventId);
  }

  void addEventToFavourites(String eventId) {
    FirebaseService.addEventToFavourites(eventId);
    currentUser!.favouriteEventsIds.add(eventId);
    notifyListeners();
  }

  void removeEventToFavourites(String eventId) {
    FirebaseService.removeEventFromFavourites(eventId);
    currentUser!.favouriteEventsIds.remove(eventId);
    notifyListeners();

  }
}
