import 'package:cully_strength_app/src/NamePicker.dart';
import 'package:cully_strength_app/src/WorkoutPage.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class NameSelectScreen extends StatefulWidget {

  @override
  _NameSelectScreen createState() => _NameSelectScreen();
}

class _NameSelectScreen extends State<NameSelectScreen> {
  String _name;
  List<DropdownMenuItem<String>> _clientNames;

  @override
  Widget build(BuildContext context) {
    _clientNames = List.empty(growable: true);
    _clientNames.add(
        DropdownMenuItem(child: Text("Carter"), value: "Carter",)
    );
    _clientNames.add(
        DropdownMenuItem(child: Text("Britt"), value: "Britt",)
    );
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Selection'),
      ),
      body: Center(
        child: Column(
          children: [
            Center(
              child: SearchableDropdown.single(
                items: _clientNames,
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                isExpanded: true,
              ),
            ),
            Center(
              child: ElevatedButton(
                child: Text("Submit"),
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/workout',
                      arguments: _name);
                },
              ),
            )
          ],
        ),
      )
    );
  }

}