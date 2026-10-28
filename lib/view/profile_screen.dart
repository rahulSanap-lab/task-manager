
import 'package:flutter/material.dart';
import 'package:taskmanager/const/appString.dart';
import 'package:taskmanager/const/bottomNavigationbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FD),

      // AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF2878F0),
        elevation: 0,
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: const Text(
          Appstring.profileTitle,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),

      // Body
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 25),

              // Profile Image
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 75,
                    backgroundColor: Color(0xFFD3E3FF),
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: Color(0xFF2878F0),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                        color: Color(0xFF2878F0),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Name
              const Text(
                Appstring.profileName,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF142238),
                ),
              ),

              const SizedBox(height: 8),

              // Email
              const Text(
                Appstring.profileEmail,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF65798E),
                ),
              ),

              const SizedBox(height: 40),

              // Profile Options Card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3EDFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.edit_outlined,
                          color: Color(0xFF2878F0),
                          size: 28,
                        ),
                      ),
                      title: const Text(
                        Appstring.profileEditProfile,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF142238),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF8091A7),
                      ),
                      onTap: () {},
                    ),

                    const Divider(color: Color(0xFFE3EDFF)),

                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3EDFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.notifications_none,
                          color: Color(0xFF2878F0),
                          size: 28,
                        ),
                      ),
                      title: const Text(
                        Appstring.profileNotifications,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF142238),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF8091A7),
                      ),
                      onTap: () {},
                    ),

                    const Divider(color: Color(0xFFE3EDFF)),

                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3EDFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.lock_outline,
                          color: Color(0xFF2878F0),
                          size: 28,
                        ),
                      ),
                      title: const Text(
                        Appstring.profilePrivacy,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF142238),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF8091A7),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, "privacy");
                      },
                    ),

                    const Divider(color: Color(0xFFE3EDFF)),

                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE3EDFF),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:  Icon(
                          Icons.info_outline,
                          color: Color(0xFF2878F0),
                          size: 28,
                        ),
                      ),
                      title: Text(
                        Appstring.profileAboutApp,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF142238),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Color(0xFF8091A7),
                      ),
                      onTap: () {
                      Navigator.pushNamed(context,"about");
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 65,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context,"login");
                  },
                  icon: const Icon(
                    Icons.logout,
                    size: 28,
                  ),
                  label: const Text(
                    Appstring.profileLogout,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFEF233C),
                    backgroundColor: const Color(0xFFFFEEEE),
                    side: const BorderSide(
                      color: Color(0xFFFFC5CB),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bar(),
    );
  }
}
