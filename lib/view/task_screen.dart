
import 'package:flutter/material.dart';
import 'package:taskmanager/const/bottomNavigationbar.dart';
import 'package:taskmanager/modal/todo_Modal.dart';
import 'package:taskmanager/repo/getdata.dart';

class task extends StatefulWidget {
  const task({super.key});

  @override
  State<task> createState() => _taskState();
}

class _taskState extends State<task> {
  final TextEditingController tsk = TextEditingController();

  List<Addtask> Tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    call_fn();
  }

  @override
  void dispose() {
    tsk.dispose();
    super.dispose();
  }

  Future<void> call_fn() async {
    final data = await getuserData().getdata();

    if (!mounted) return;

    setState(() {
      Tasks = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FC),

      appBar: AppBar(
        backgroundColor: const Color(0xFF2585F5),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Your Tasks",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "My Tasks",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF202B40),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3EEFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${Tasks.length} tasks",
                    style: const TextStyle(
                      color: Color(0xFF2585F5),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF2585F5),
                      ),
                    )
                  : Tasks.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.task_alt,
                                size: 65,
                                color: Colors.blue.shade200,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                "No tasks yet",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF667085),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                "Tap + to add your first task",
                                style: TextStyle(
                                  color: Color(0xFF98A2B3),
                                ),
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: Tasks.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(12),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 7,
                                ),

                                title: Text(
                                  Tasks[index].title ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF202B40),
                                  ),
                                ),

                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () => edi(index),
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: Color(0xFF2585F5),
                                        size: 22,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => del(index),
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Color(0xFFE05252),
                                        size: 23,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2585F5),
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onPressed: addTaskDialog,
        child: const Icon(Icons.add, size: 30),
      ),
      bottomNavigationBar: bar(),
    );
  }

  Future<void> addTaskDialog() async {
    tsk.clear();

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Add Task"),
          content: TextField(
            controller: tsk,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Enter task name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.edit_note),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (tsk.text.trim().isEmpty) return;

                await getuserData().postdata(tsk.text.trim());

                if (!mounted) return;

                Navigator.pop(dialogContext);
                tsk.clear();
                await call_fn();
               
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Task added successfully!"),
                    backgroundColor: Colors.green,
                  ));


              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  Future<void> edi(int index) async {
    tsk.text = Tasks[index].title ?? "";

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Update Task"),
          content: TextField(
            controller: tsk,
            autofocus: true,
            decoration: InputDecoration(
              hintText: "Update task name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (tsk.text.trim().isEmpty) return;

                await getuserData().putdata(
                  Tasks[index].id!,
                  tsk.text.trim(),
                );

                if (!mounted) return;

                Navigator.pop(dialogContext);
                tsk.clear();
                await call_fn();

                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Task updated successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  Future<void> del(int index) async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text("Delete Task"),
          content: const Text(
            "Are you sure you want to delete this task?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE05252),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await getuserData().deletedata(Tasks[index].id!);

                if (!mounted) return;

                Navigator.pop(dialogContext);
                await call_fn();

                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Task deleted successfully!"),
                  ),
                );
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
