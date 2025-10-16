import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app_sqflite/controller/note_screen_controller.dart';
import 'package:note_app_sqflite/view/Note_add_screen/note_add_screen.dart';
import 'package:note_app_sqflite/view/Note_details_screen/note_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Notescreencontroller.getAllNotes();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NoteAddScreen()),
          );
          setState(() {});
        },
        elevation: 10,
        foregroundColor: Colors.amber,
        child: Icon(Icons.add, size: 25),
      ),
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        leading: Center(child: CircleAvatar()),
        title: Text(
          "Abdulla",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: Drawer(),
      // backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Column(
          spacing: 10,
          children: [
            Text(
              "MyNotes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: MasonryGridView.builder(
                itemCount: Notescreencontroller.notelist.length,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => InkWell(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete Note'),
                          content: const Text(
                            'Are you sure you want to delete this item?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // close dialog
                              },
                              child: const Text('Cancel',style: TextStyle(color: Colors.black)),
                            ),
                            TextButton(
                              onPressed: () async {
                                await Notescreencontroller.deleteElements(
                                  Notescreencontroller
                                      .notelist[index]["id"], // unique id
                                );
                                setState(() {});
                                Navigator.of(context).pop(); // close dialog
                              },
                              child: const Text('Delete',style: TextStyle(color: Colors.red),),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoteDetailsScreen(title:  Notescreencontroller
                                          .notelist[index]["title"],des:  Notescreencontroller
                                          .notelist[index]["des"],date:  Notescreencontroller
                                          .notelist[index]["date"],category:  Notescreencontroller
                                          .notelist[index]["category"]),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),

                    width: 150,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Notescreencontroller.notelist[index]["title"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {  // edit note
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NoteAddScreen(
                                      isedit: true,
                                      noteid:Notescreencontroller
                                          .notelist[index]["id"],
                                      notetitle: Notescreencontroller
                                          .notelist[index]["title"],
                                      notedes: Notescreencontroller
                                          .notelist[index]["des"],
                                      notetdate: Notescreencontroller
                                          .notelist[index]["date"],
                                      notecategory: Notescreencontroller
                                          .notelist[index]["category"],
                                    ),
                                  ),
                                );
                                setState(() {});
                              },
                              icon: Icon(Icons.edit, color: Colors.black),
                            ),
                          ],
                        ),
                        Text(
                          Notescreencontroller.notelist[index]["des"],
                          textAlign: TextAlign.justify,
                          maxLines: index + 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,

                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.date_range),
                            Text(
                              Notescreencontroller.notelist[index]["date"],

                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
