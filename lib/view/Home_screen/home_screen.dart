import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:note_app_sqflite/view/Note_details_screen/note_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {},
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
      body: Column(
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
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteDetailsScreen(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                  ),
                  height: 200,
                  width: 150,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Note details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Notes here",
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white,
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
                            "12/3/2026",
                            style: TextStyle(
                              color: Colors.white,
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
    );
  }
}
