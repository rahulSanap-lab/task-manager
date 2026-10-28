
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
  List<Addtask> tasks = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    final data = await getuserData().getdata();

    if (!mounted) return;

    setState(() {
      tasks = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FD),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2878F0),
        elevation: 0,
        toolbarHeight: 70,
        leading: const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 35,
        ),
        title: const Text(
          'Task Manager',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "profile");
              },
              icon: const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              goodm(),

              const SizedBox(height: 5),

              welback(),

              const SizedBox(height: 18),

              dashboard(),

              const SizedBox(height: 12),

              card(),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Tasks",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF142238),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "tasks");
                    },
                    child: const Text(
                      "View all →",
                      style: TextStyle(
                        color: Color(0xFF2878F0),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Expanded(
                child: tasks.isEmpty
                    ? const Center(
                        child: Text(
                          "No tasks available",
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.06),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tasks[index].title ?? "",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF142238),
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            size: 15,
                                            color: Colors.blueGrey,
                                          ),
                                          SizedBox(width: 6),
                                          Text(
                                            "Task",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blueGrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons.more_vert,
                                  color: Colors.blueGrey,
                                ),
                              ],
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

  Widget goodm() {
    return const Text(
      'Good Morning,',
      style: TextStyle(
        fontSize: 19,
        color: Color(0xFF65798E),
      ),
    );
  }

  Widget welback() {
    return const Text(
      'Welcome Back!',
      style: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        color: Color(0xFF142238),
      ),
    );
  }

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

  Widget card() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE3EDFF),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
              color: Color(0xFFD3E3FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.assignment_rounded,
              size: 50,
              color: Color(0xFF2878F0),
            ),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Tasks',
                  style: TextStyle(
                    fontSize: 19,
                    color: Color(0xFF65798E),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "${tasks.length}",
                  style: const TextStyle(
                    fontSize: 42,
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
