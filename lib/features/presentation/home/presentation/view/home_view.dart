import 'package:flutter/material.dart';
import 'package:flutter_exemplo_armazenamento/core/widgets/home_option_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: HomeOptionWidget(
                color: Colors.green,
                label: 'Shared Preferences',
                onTap: () {
                  Navigator.pushNamed(context, '/sharedPrefs');
                },
              ),
            ),
            Expanded(
              child: HomeOptionWidget(
                color: Colors.blue,
                label: 'Flutter Secure Storage',
                onTap: () {
                  Navigator.pushNamed(context, '/secureStorage');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
