
import 'package:flutter/material.dart';
import 'package:taskmanager/const/appString.dart';

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
        title: Text(Appstring.privacyTitle),
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
              Appstring.privacyAppName,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8),

            Text(
              Appstring.privacySubtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
              ),
            ),

            SizedBox(height: 20),

            Text(
              Appstring.privacyIntro,
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
                    title: Text(Appstring.privacyInfoCollect),
                    subtitle: Text(
                      Appstring.privacyInfoCollectSub,
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
                    title: Text(Appstring.privacyHowWeUse),
                    subtitle: Text(
                      Appstring.privacyHowWeUseSub,
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
                    title: Text(Appstring.privacyDataSecurity),
                    subtitle: Text(
                      Appstring.privacyDataSecuritySub,
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
                    title: Text(Appstring.privacyThirdParty),
                    subtitle: Text(
                      Appstring.privacyThirdPartySub,
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
                    title: Text(Appstring.privacyYourRights),
                    subtitle: Text(
                      Appstring.privacyYourRightsSub,
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            Text(
              Appstring.privacyLastUpdated,
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
