import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomStatusBar extends StatelessWidget {
  final String batteryLevel; //    battery    
  final bool isWifiConnected; //     WiFi

  const CustomStatusBar({
    Key? key,
    required this.batteryLevel,
    required this.isWifiConnected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      color: Colors.black,   
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //    icons  
          Row(
            children: [
              Icon(
                Icons.signal_wifi_4_bar,
                color: isWifiConnected ? Colors.white : Colors.grey,
              ),
              const SizedBox(width: 8),
              Text(
                batteryLevel,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.battery_full,
                color: Colors.white,
              ),
            ],
          ),
           Row(
            children: [
              Icon(Icons.bluetooth, color: Colors.white),
              const SizedBox(width: 8),
              Icon(Icons.notifications, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
