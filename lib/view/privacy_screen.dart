
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() =>
      _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FD),

      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Color(0xFF2878F0),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            SizedBox(height: 20),

            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFE0ECFF),
              child: Icon(
                Icons.shield_outlined,
                size: 60,
                color: Color(0xFF2878F0),
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Task Manager',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              'Your privacy matters to us',
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),

            SizedBox(height: 20),

            Text(
              'We care about your privacy. '
              'Read below to understand how your information '
              'is collected and used.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.blueGrey,
              ),
            ),

            SizedBox(height: 25),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person_outline,
                      color: Color(0xFF2878F0),
                      size: 30,
                    ),
                    title: Text('Information We Collect'),
                    subtitle: Text(
                      'Information collected while using the app.',
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.settings_outlined,
                      color: Color(0xFF2878F0),
                      size: 30,
                    ),
                    title: Text('How We Use Your Information'),
                    subtitle: Text(
                      'How your information is used.',
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.security,
                      color: Color(0xFF2878F0),
                      size: 30,
                    ),
                    title: Text('Data Security'),
                    subtitle: Text(
                      'How we protect your information.',
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.visibility_outlined,
                      color: Color(0xFF2878F0),
                      size: 30,
                    ),
                    title: Text('Third-Party Services'),
                    subtitle: Text(
                      'Information about external services.',
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(
                      Icons.description_outlined,
                      color: Color(0xFF2878F0),
                      size: 30,
                    ),
                    title: Text('Your Rights'),
                    subtitle: Text(
                      'Manage your personal information.',
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Text(
              'Last updated: October 2026',
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 13,
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
