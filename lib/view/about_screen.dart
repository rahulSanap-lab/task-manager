
import 'package:flutter/material.dart';
import 'package:taskmanager/const/appString.dart';

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
          Appstring.aboutTitle,
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
              Appstring.aboutAppName,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              Appstring.aboutVersion,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              Appstring.aboutDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              Appstring.aboutDeveloper,
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
                    title: const Text(Appstring.aboutAppInfo),
                    subtitle: const Text(
                      Appstring.aboutAppInfoSubtitle,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        Appstring.aboutAppInfo,
                        Appstring.aboutAppInfoDetail,
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip_outlined,
                      color: primaryColor,
                    ),
                    title: const Text(Appstring.aboutPrivacyPolicy),
                    subtitle: const Text(Appstring.aboutPrivacySubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        Appstring.aboutPrivacyPolicy,
                        Appstring.aboutPrivacyDetail,
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.description_outlined,
                      color: primaryColor,
                    ),
                    title: const Text(Appstring.aboutTerms),
                    subtitle: const Text(Appstring.aboutTermsSubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        Appstring.aboutTerms,
                        Appstring.aboutTermsDetail,
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.mail_outline,
                      color: primaryColor,
                    ),
                    title: const Text(Appstring.aboutContact),
                    subtitle: const Text(Appstring.aboutContactSubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        Appstring.aboutContact,
                        Appstring.aboutContactDetail,
                      );
                    },
                  ),

                  const Divider(height: 1, indent: 16, endIndent: 16),

                  ListTile(
                    leading: Icon(
                      Icons.star_outline,
                      color: primaryColor,
                    ),
                    title: const Text(Appstring.aboutRate),
                    subtitle: const Text(Appstring.aboutRateSubtitle),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      showInfo(
                        Appstring.aboutRate,
                        Appstring.aboutRateDetail,
                      );
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              Appstring.aboutMadeWith,
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
              child: const Text(Appstring.aboutOkBtn),
            ),
          ],
        );
      },
    );
  }
}
