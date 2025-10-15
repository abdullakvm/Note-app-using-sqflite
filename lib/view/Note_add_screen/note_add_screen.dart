import 'package:flutter/material.dart';
import 'package:note_app_sqflite/controller/note_screen_controller.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Add note",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 10,
            children: [
              TextFormField(
                controller: titlecontroller,
                maxLines: 3,
                minLines: 1,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter",
                  label: Text("Title", style: TextStyle(color: Colors.grey)),
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              TextFormField(
                controller: descriptioncontroller,
                maxLines: 15,
                minLines: 5,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Enter",
                  label: Text(
                    "Note Description",
                    style: TextStyle(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  spacing: 20,
                  children: [
                    Text(
                      "Category  : ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        onChanged: (value) {
                          Notescreencontroller.selectedCategory(value);
                          setState(() {});
                        },
                        style: TextStyle(color: Colors.grey),
                        value: Notescreencontroller.selectedcategory,
                        hint: Text(
                          "Select",
                          style: TextStyle(color: Colors.grey),
                        ),
                        isExpanded: true,
                        dropdownColor: Colors.black,
                        menuWidth: MediaQuery.sizeOf(context).width,
                        items: List.generate(
                          Notescreencontroller.categories.length,
                          (index) => DropdownMenuItem<String>(
                            value: Notescreencontroller.categories[index]
                                .toUpperCase(),
                            child: Text(
                              Notescreencontroller.categories[index]
                                  .toUpperCase(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: datecontroller,
                readOnly: true,
                onTap: () async {
                  datecontroller.text =
                      await Notescreencontroller.dateSelection(context);
                  // setState(() {

                  // });
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  // hintText: "Enter",
                  label: Text("Date", style: TextStyle(color: Colors.grey)),
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  suffixIcon: Icon(
                    Icons.calendar_month_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                 await Notescreencontroller.addNote(
                    title: titlecontroller.text,
                    des: descriptioncontroller.text,
                    date: datecontroller.text,
                  );
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
