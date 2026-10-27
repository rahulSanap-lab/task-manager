import 'package:flutter/material.dart';
import 'package:taskmanager/const/bottomNavigationbar.dart';
import 'package:taskmanager/modal/todo_Modal.dart';
import 'package:taskmanager/repo/getdata.dart';

class task extends StatefulWidget {
  const new({super.key});

  @override
  State<task> createState() => _taskState();
}

TextEditingController tsk = TextEditingController();

class _taskState extends State<task> {
  List<Addtask> Tasks = [];

  @override
  void initState() {
    super.initState();
    call_fn();
  }

  Future call_fn() async {
    final data = await getuserData().getdata();

    setState(() {
      Tasks = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Your Tasks"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: Tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(255, 116, 228, 236),
                    child: Column(
                      children: [
                        ListTile(
                          
                          title: Text(Tasks[index].title ?? ""),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [edi(index), del(index)],
                          ),
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(33, 212, 243, 1),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add Task"),
                content: TextFormField(
                  decoration: InputDecoration(hintText: "Add Task"),
                  controller: tsk,
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      if (tsk.text.trim().isEmpty) return;

                      await getuserData().postdata(tsk.text.trim());

                      Navigator.pop(context);

                      await call_fn();
                      tsk.clear();
                    },
                    child: Text("Add"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, context);
                      tsk.clear();
                    },
                    child: Text("Cancel"),
                  ),
                ],
              );
            },
          );
        },

        child: Icon(Icons.add),
      ),
    
    // bottomNavigationBar: bar(),

    );
  }

  Widget edi(int index) {
    return IconButton(
      onPressed: () {
        tsk.text = Tasks[index].title ?? "";
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("update Task"),
              content: TextFormField(
                decoration: InputDecoration(hintText: "update Task"),
                controller: tsk,
              ),

              actions: [
                TextButton(
                  onPressed: () async {
                    if (tsk.text.trim().isEmpty) return;

                    await getuserData().putdata(Tasks[index].id!, tsk.text);

                    await call_fn();
                    tsk.clear();
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Task updated successfully!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: Text("Update"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, context);
                    // tsk.clear();
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(Icons.edit),
    );
  }

  Widget del(int index) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Delete Task"),
              content: Text("are you sure you want delete task"),
              actions: [
                TextButton(
                  onPressed: () async {
                    await getuserData().deletedata(Tasks[index].id!);

                    await call_fn();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Task deleted successfully!"),
                        backgroundColor: const Color.fromARGB(
                          255,
                          50,
                          136,
                          218,
                        ),
                      ),
                    );

                    Navigator.pop(context);
                  },
                  child: Text("Yes"),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"),
                ),
              ],
            );
          },
        );
      },
      icon: Icon(Icons.delete),
    );
  }
}
