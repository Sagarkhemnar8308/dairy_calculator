import 'package:dairy_calculator/utils/localpreferences.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, String?>>(
        future: LocaleStorage.getProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final profile = snapshot.data ?? {};
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Name: ${profile['name'] ?? ''}'),
              Text('Surname: ${profile['surname'] ?? ''}'),
              Text('Village: ${profile['village'] ?? ''}'),
              Text('Pincode: ${profile['pincode'] ?? ''}'),
            ],
          );
        },
      ),
    );
  }
}
