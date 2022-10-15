import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TimeOfDay? time = const TimeOfDay(hour: 12, minute: 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${time!.hour.toString()}:${time!.minute.toString()}',
          style: TextStyle(fontSize: 60),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TimeOfDay? new_time =
              await showTimePicker(context: context, initialTime: time!);
          if (new_time != null) {
            setState(() {
              time = new_time;
            });
          }
        },
        child: Icon(Icons.access_time_outlined),
      ),
    );
  }
}
