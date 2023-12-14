import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  String? selectedGroups;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  TextEditingController donorName = TextEditingController();
  TextEditingController donorPhone = TextEditingController();
  void addDoner() {
    final data = {
      'name': donorName.text,
      'phone': donorPhone.text,
      'group': selectedGroups
    };
    donor.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text(
          'Add Doners',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: donorName,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Donor Name'),
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: donorPhone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Phone Number'),
              ),
              keyboardType: TextInputType.number,
              maxLength: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButtonFormField(
              decoration:
                  const InputDecoration(label: Text('Select Blood Group')),
              items: bloodGroups
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (value) => selectedGroups = value as String?,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              onPressed: () {
                addDoner();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 50),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
