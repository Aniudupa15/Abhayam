import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyGuardianScreen extends StatelessWidget {
  // List of guardians with their names, contact numbers, and distances
  final List<Map<String, String>> guardians = [
    {'name': 'Prathiksha', 'contact': '6362514467', 'distance': '500m away'},
    {'name': 'Melisha', 'contact': '9844283575', 'distance': '1.2km away'},
    {'name': 'Thrisha', 'contact': '8660489690', 'distance': '1.5km away'},
    {'name': 'Diya', 'contact': '8714791185', 'distance': '1.5km away'},
  ];

  // Function to initiate the phone call
  Future<void> _callGuardian(String contact) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: contact,
    );
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      // Show an error if the phone call can't be launched
      throw 'Could not place a call to $contact';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Guardians'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: guardians.length,
        itemBuilder: (context, index) {
          final guardian = guardians[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.purple, size: 40),
              title: Text(
                guardian['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${guardian['distance']} - ${guardian['contact']}'),
              trailing: Icon(Icons.phone, color: Colors.green),
              onTap: () {
                // Trigger the call functionality when tapped
                _callGuardian(guardian['contact']!);
              },
            ),
          );
        },
      ),
    );
  }
}
