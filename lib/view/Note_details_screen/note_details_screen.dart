import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({super.key , this.title , this.des ,this.category ,this.date} );
 final String? title ; 
 final String? des ; 
 final String? category ; 
 final String? date ; 
 
 

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(widget.title ?? "",style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),),
                      Text(widget.date ?? "",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),),
                    ],
                  ),
                  Text(widget.des??"",style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
                Text(widget.category??"",style: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),)
                ],
              ),
            ),
    );
  }
}