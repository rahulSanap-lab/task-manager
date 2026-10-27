
import 'package:flutter/material.dart';
import 'package:taskmanager/const/bottomNavigationbar.dart';
import 'package:taskmanager/modal/todo_Modal.dart';
import 'package:taskmanager/repo/getdata.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
 
 List <Addtask> tasks = [];

 void initState(){
  super.initState();
  fetch();
 }

 void fetch ()async{
  final data = await getuserData().getdata();
   setState(() {
     tasks = data ;
   });
  
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FD),

      // AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFF2878F0),
        elevation: 5,
        toolbarHeight: 85,
        leading: const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 42,
        ),
        title: const Text(
          'Task Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(onPressed:(){
              Navigator.pushNamed(context,"profile");
            },
             icon:Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 42,
            ),)
          ),
        ],
      ),

      // Body
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),

              goodm(),

              const SizedBox(height: 5),

              welback(),

              const SizedBox(height: 5),

              dashboard(),

              const SizedBox(height: 5),

              card(),

              const SizedBox(height: 5),

              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: const Color.fromARGB(255, 201, 213, 253),
                      child: ListTile(
                        title: Text(tasks[index].title ?? ""),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: bar(),
    );
  }

  // Good Morning
  Widget goodm() {
    return const Text(
      'Good Morning,',
      style: TextStyle(
        fontSize: 25,
        color: Color(0xFF65798E),
      ),
    );
  }

  // Welcome Back
  Widget welback() {
    return const Text(
      'Welcome Back!',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF142238),
      ),
    );
  }

  // Dashboard Title
  Widget dashboard() {
    return const Text(
      'Dashboard',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF142238),
      ),
    );
  }

  // Total Tasks Card
  Widget card() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE3EDFF),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: const BoxDecoration(
              color: Color(0xFFD3E3FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.assignment,
              size: 65,
              color: Color(0xFF2878F0),
            ),
          ),

           SizedBox(width: 20),

           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Tasks',
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xFF65798E),
                  ),
                ),

                SizedBox(height: 8),

                Text(
              "   ${tasks.length}" ,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2878F0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
