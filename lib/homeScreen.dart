import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Lesson {
  Lesson({required this.title, required this.time});
  final String title;
  final TimeOfDay time;
}

List lessons_list = [
  Lesson(title: 'Math', time: TimeOfDay(hour: 10, minute: 10)),
  Lesson(title: 'Math', time: TimeOfDay(hour: 10, minute: 10)),
  Lesson(title: 'Math', time: TimeOfDay(hour: 10, minute: 10)),
  Lesson(title: 'Math', time: TimeOfDay(hour: 10, minute: 10))
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(
          'Lessons Stream 📚',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Edit',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: lessons_list.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(top: 2.0, left: 10, right: 10),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                lessons_list[index].title,
                                style: TextStyle(fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(
                                '${lessons_list[index].time.hour.toString()}:${lessons_list[index].time.minute.toString()}',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

