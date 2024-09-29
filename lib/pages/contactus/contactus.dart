import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Color(0xFF295F98), // لون أزرق
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.black, // لون الخلفية أسود
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in Touch',
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF295F98)), // لون الأزرق
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF295F98)),
                ),
                filled: true,
                fillColor: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF295F98)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF295F98)),
                ),
                filled: true,
                fillColor: Colors.grey[800],
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF295F98)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF295F98)),
                ),
                filled: true,
                fillColor: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // هنا يمكنك إضافة منطق لإرسال الرسالة
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF295F98), // لون الأزرق
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: Text('Send Message', style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20.0),
            Text(
              'Follow us on Social Media',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                  onPressed: () {
                    // هنا يمكنك إضافة منطق لفتح فيسبوك
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.twitter, color: Colors.lightBlue),
                  onPressed: () {
                    // هنا يمكنك إضافة منطق لفتح تويتر
                  },
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.instagram, color: Colors.pink),
                  onPressed: () {
                    // هنا يمكنك إضافة منطق لفتح إنستغرام
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
