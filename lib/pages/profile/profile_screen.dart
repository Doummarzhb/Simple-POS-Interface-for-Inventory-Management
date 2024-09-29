import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String email;
  String city;
  String phoneNumber;

  ProfileScreen({
    Key? key,
    required this.name,
    required this.email,
    required this.city,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cityController.text = widget.city;
    phoneController.text = widget.phoneNumber;
  }

  void _updateProfile() {
    setState(() {
      widget.city = cityController.text;
      widget.phoneNumber = phoneController.text;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('lib/images/avatar.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(widget.email, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 10),
            Text('City: ${widget.city}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 10),
            Text('Phone: ${widget.phoneNumber}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Edit Profile'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: cityController,
                              decoration: const InputDecoration(
                                labelText: 'City',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              controller: phoneController,
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: _updateProfile,
                            child: const Text('Save'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Cancel'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Edit Profile'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,       
                  onPrimary: Colors.white,      
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: const Text('Connect with me:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: const FaIcon(FontAwesomeIcons.facebook), onPressed: () {}),
                IconButton(icon: const FaIcon(FontAwesomeIcons.twitter), onPressed: () {}),
                IconButton(icon: const FaIcon(FontAwesomeIcons.instagram), onPressed: () {}),
                IconButton(icon: const FaIcon(FontAwesomeIcons.linkedin), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
