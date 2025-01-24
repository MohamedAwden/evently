import 'package:evently/modals/catgories.dart';
import 'package:flutter/material.dart';

import '../firebase_service.dart';
import '../modals/event.dart';

class EventsProvider with ChangeNotifier {
  List<Event>events=[];
  List<Event>favouriteEvents=[];
  Catgories? selectedCategory;


  Future<void> getEvents() async{
    events = await FirebaseService.getEventsFromFirestore(selectedCategory?.id);
    // events.sort((event, nextEvent)=>event.dateTime.compareTo(nextEvent.dateTime))
    notifyListeners();
  }
  Future<void> deleteEvent(String eventId) async {
    await FirebaseService.deleteEventFromFirestore(eventId);
    events.removeWhere((event) => event.id == eventId);
    notifyListeners();
  }
  void changeSelectedCategory (Catgories? category){
    selectedCategory = category;
    getEvents();
  }
  Future<void> addToFavourites(String eventId){
   return FirebaseService.addEventToFavourites(eventId);
  }
  Future<void> removeFromFavourites(String eventId){
    return FirebaseService.removeEventFromFavourites(eventId);
  }
  void filterFavouriteEvents(List<String> favouriteIds){
    favouriteEvents =  events.where((event) => favouriteIds.contains(event.id)).toList();
    notifyListeners();
  }
}