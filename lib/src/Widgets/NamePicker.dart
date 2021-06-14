import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/Client.dart';

class NamePicker extends StatefulWidget {
  @override
  _NamePickerState createState() => _NamePickerState();
}

class _NamePickerState extends State<NamePicker> {

  String? _nameSelected;
  List<DropdownMenuItem<String>>? _clientNames;

  void pickUser() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference clients = firestore.collection("Clients");

    final clientsRef = FirebaseFirestore.instance.collection("Clients").withConverter(
        fromFirestore: (snapshot, _) => Client.fromJson(snapshot.data()!),
        toFirestore: (Client client, _) => client.toJson());

    print(clientsRef.get().toString());
    _clientNames = List.empty(growable: true);
    _clientNames!.add(
      DropdownMenuItem(child: Text("Carter"), value: "Carter",)
    );
    // TODO: implement build
    return Center(
      child: DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
          label: "Menu mode",
          hint: "country in menu mode",
          popupItemDisabled: (String s) => s.startsWith('I'),
          onChanged: print,
          selectedItem: "Brazil"),
    );
  }
}