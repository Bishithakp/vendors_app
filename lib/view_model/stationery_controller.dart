import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StationeryController extends ChangeNotifier {
  StationeryController() {
    fetchUsers();
  }
  final types = <Map<String, String>>[
    const {"id": "drop", "label": "DropDown"},
    const {"id": "high", "label": "High"},
    const {"id": "medium", "label": "Medium"},
    const {"id": "low", "label": "Low"},
  ];
  String selectedPen = "drop";
  setpenValue(String value) {
    selectedPen = value;
    updatePenStatus(value);
    notifyListeners();
  }

  String selectedPencil = "drop";
  setpencilValue(String value) {
    selectedPencil = value;
    updatePencilStatus(value);
    notifyListeners();
  }

  String selectedbook = "drop";
  setbookValue(String value) {
    selectedbook = value;
    updateBookStatus(value);
    notifyListeners();
  }

  Future<void> updatePenStatus(
    String value,
  ) {
    CollectionReference subhashdata =
        FirebaseFirestore.instance.collection('subhashdata');

    return subhashdata
        .doc('PtKyrwfneDasWwmBO8Vi')
        .update({'penstatus': selectedPen})
        .then((value) => print(" updated successfully!"))
        .catchError((error) => print("Failed to update : $error"));
  }

  Future<void> updatePencilStatus(
    String value,
  ) {
    CollectionReference subhashdata =
        FirebaseFirestore.instance.collection('subhashdata');

    return subhashdata
        .doc('PtKyrwfneDasWwmBO8Vi')
        .update({'pencilstatus': selectedPencil})
        .then((value) => print(" updated successfully!"))
        .catchError((error) => print("Failed to update : $error"));
  }

  Future<void> updateBookStatus(
    String value,
  ) {
    CollectionReference subhashdata =
        FirebaseFirestore.instance.collection('subhashdata');

    return subhashdata
        .doc('PtKyrwfneDasWwmBO8Vi')
        .update({'bookstatus': selectedbook})
        .then((value) => print(" updated successfully!"))
        .catchError((error) => print("Failed to update : $error"));
  }

  Future<void> fetchUsers() async {
    var collection = FirebaseFirestore.instance.collection('subhashdata');
    var docSnapshot = await collection.doc('PtKyrwfneDasWwmBO8Vi').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['bookstatus'];
      selectedbook=value; 
      selectedPen=data?['penstatus'];
      selectedPencil=data?['pencilstatus'];
      notifyListeners();// <-- The value you want to retrieve.
    }
  }
}
