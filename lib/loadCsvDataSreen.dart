import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class LoadCsvDataScreen extends StatelessWidget {
  final String path;

  LoadCsvDataScreen({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CSV DATA"),
      ),
      body: FutureBuilder(
        future: loadingCsvData(path),
        builder: (context, AsyncSnapshot snapshot) {
          print(snapshot.data.toString());
          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: snapshot.data!
                        .map<Widget>(
                          (data) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(data[4].toString()),
                                Text(
                                  data[4].toString(),
                                ),
                                Text(
                                  data[4].toString(),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      for (var element in data) {
                                        print(element);
                                      }
                                    },
                                    child: Text('amongus'))
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;

      final input = new File(file.path!).openRead();
      final fields = await input
          .transform(utf8.decoder)
          .transform(new CsvToListConverter())
          .toList();

      print(fields);
    }
  }

  Future loadingCsvData(String path) async {
    final csvFile = new File(path).openRead();
    return await csvFile
        .transform(utf8.decoder)
        .transform(
          CsvToListConverter(),
        )
        .toList();
  }
}
