
import 'package:flutter/material.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  final Color primaryColor = const Color(0xFF2878F0);
  final Color backgroundColor = const Color(0xFFF4F7FD);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        title: const Text(
          'About App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            // App Icon
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 65,
              ),
            ),

            const SizedBox(height: 20),

            // App Name
            const Text(
              'Task Manager',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Manage your daily tasks easily\nand stay productive.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Developed by Rahul Sanap',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 30),

            // Information Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: primaryColor,
                    ),
                    title: const Text('App Information'),
                    subtitle: const Text(
                      'App name, version and developer',
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        'App Information',
                        'Task Manager\nVersion 1.0.0\nDeveloped by Rahul Sanap',
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: primaryColor,
                    ),
                    title: const Text('Privacy Policy'),
                    subtitle: const Text('How we handle your data'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        'Privacy Policy',
                        'Privacy policy details will be added here.',
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.description_outlined,
                      color: primaryColor,
                    ),
                    title: const Text('Terms & Conditions'),
                    subtitle: const Text('Rules for using our app'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        'Terms & Conditions',
                        'Terms and conditions will be added here.',
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.mail_outline,
                      color: primaryColor,
                    ),
                    title: const Text('Contact Us'),
                    subtitle: const Text('Get help or send feedback'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        'Contact Us',
                        'Contact details will be added here.',
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.star_outline,
                      color: primaryColor,
                    ),
                    title: const Text('Rate This App'),
                    subtitle: const Text('Share your experience'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        'Rate This App',
                        'Thank you for using Task Manager!',
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Made with ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  // Show information dialog
  void showInfo(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
