import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cully_strength_app/src/Models/Day.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../Models/Client.dart';
import 'ExercisePreviewPage.dart';

class NameSelectScreen extends StatefulWidget {

  @override
  _NameSelectScreen createState() => _NameSelectScreen();
}

class _NameSelectScreen extends State<NameSelectScreen> {
  String? _name;
  List<Client>? _clients;
  Client? _selectedClient;
  Client? _selectedClient2;
  int? _currentBlock;
  int? _currentBlock2;
  int? _currentWeek;
  int? _currentWeek2;
  Day? _currentDay;
  Day? _currentDay2;
  bool _twoClients = false;

  @override
  void initState() {
    super.initState();
    buildNameList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Selection'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.all(10),
                  child: DropdownSearch<Client>(
                      mode: Mode.MENU,
                      showSelectedItem: true,
                      items: _clients,
                      itemAsString: (Client c) => c.toNameString(),
                      label: "Menu mode",
                      hint: "country in menu mode",
                      onChanged: (Client? client) => setSelectedClient(client!),
                      selectedItem: _clients!.first,
                      compareFn: (Client client1, Client? client2) => client1.compareClients(client2))
              )
            ),
            Visibility(
              visible: _twoClients,
              child: Center(
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: DropdownSearch<Client>(
                        mode: Mode.MENU,
                        showSelectedItem: true,
                        items: _clients,
                        itemAsString: (Client c) => c.toNameString(),
                        label: "Menu mode",
                        hint: "country in menu mode",
                        onChanged: (Client? client) => setSelectedClient2(client!),
                        selectedItem: _clients!.first,
                        compareFn: (Client client1, Client? client2) => client1.compareClients(client2))
                )
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text(_twoClients ? "Remove Second Person" : "Press here to add another person"),
                onPressed: () {
                  var twoClients;
                  if (!_twoClients) {
                    twoClients = true;
                  }
                  else twoClients = false;
                  setState(() {
                    _twoClients = twoClients;
                  });
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExercisePreviewPage(
                        dayInfo: _currentDay,
                        dayInfo2: _currentDay2,
                        name1: "${_selectedClient!.firstName} ${_selectedClient!.lastName}",
                        name2: "${_selectedClient2!.firstName} ${_selectedClient2!.lastName}"
                      ))
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<String> buildNameList() async {

    final clientsRef = FirebaseFirestore.instance.collection("Clients").withConverter(
        fromFirestore: (snapshot, _) => Client.fromJson(snapshot.data()!),
        toFirestore: (Client client, _) => client.toJson());

    QuerySnapshot<Client> clientSnapshot = await clientsRef.get();

    var test = clientSnapshot.docs.first.data();

    List<Client> tempList = List.empty(growable: true);
    clientSnapshot.docs.toList().forEach((element) {
      tempList.add(element.data());
    });

    setState(() {
      _clients = tempList;
    });
    developer.log(_clients.toString());

    return "success";
  }
  
  void setSelectedClient(Client client) {
    setState(() {
      _selectedClient = client;
      _currentBlock = client.currentMultipliers.block;
      _currentWeek = client.currentMultipliers.week;
      _currentDay = _selectedClient!.multipliers.multipliers[_currentBlock!].weeks[_currentWeek!]!.days[0];
    });
    developer.log("selected" + _selectedClient!.toNameString());
  }

  void setSelectedClient2(Client client) {
    _selectedClient2 = client;
    _currentBlock2 = client.currentMultipliers.block;
    _currentWeek2 = client.currentMultipliers.week;
    _currentDay2 = _selectedClient2!.multipliers.multipliers[_currentBlock2!].weeks[_currentWeek2!]!.days[0];
  }
}