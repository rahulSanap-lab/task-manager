import 'package:flutter/material.dart';
import 'package:taskmanager/modal/todo_Modal.dart';
import 'package:taskmanager/repo/getdata.dart';

class task extends StatefulWidget {
  const new({super.key});

  @override
  State<task> createState() => _taskState();
}

TextEditingController tsk = TextEditingController();

class _taskState extends State<task> {

  List <Addtask> Tasks= [] ;

  @override 
   
   void initState(){
    super.initState() ;
    call_fn() ;
   }

   Future call_fn() async{
    final data = await getuserData().getdata() ;

    setState(() {
      Tasks = data ;
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
                          // leading: CircleAvatar(
                          //   backgroundColor: const Color.fromARGB(
                          //     255,
                          //     15,
                          //     183,
                          //     235,
                          //   ),
                          // ),
                          title: Text(Tasks[index].title ?? ""),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [edi(), del()],
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
                    onPressed: () async{

                      if(tsk.text.trim().isEmpty) return ;

                      await getuserData().postdata(tsk.text.trim());
                     
                      
                      tsk.clear();
                      Navigator.pop(context);
                      
                      await call_fn();
                  
                      



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
    );
  }

  Widget edi() {
    return IconButton(
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("save"),
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
      icon: Icon(Icons.edit),
    );
  }

  Widget del() {
    return IconButton(onPressed: () {

      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text("Delete Task"),
          actions: [
            TextButton(onPressed: (){Navigator.pop(context);}, child:Text("Yes")),
             TextButton(onPressed: (){Navigator.pop(context);}, child:Text("No"))
          ],
        );
      });
    }, icon: Icon(Icons.delete));
  }
}
