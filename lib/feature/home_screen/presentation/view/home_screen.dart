import 'package:e_commerce/core/wep_services/auth_wep_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(
        onPressed: (){
          AuthWebServices().logout();
        },
        child: Text('sign out'),
      ),),
    );
  }
}
