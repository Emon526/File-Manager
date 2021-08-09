import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

//import package files

//apply this class on home: attribute agt MaterialApp()
class MyDocumentList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDocumentList(); //create state
  }
}

class _MyDocumentList extends State<MyDocumentList> {
  var files;

  void getFiles() async {
    //asyn function to get list of files
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0]
        .rootDir; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree(excludedPaths: [
      "/storage/emulated/0/Android"
    ], extensions: [
      "pdf",
      "docx",
      "txt",
    ] //optional, to filter files, list only mp3 files
        );
    setState(() {}); //update the UI
  }

  @override
  void initState() {
    getFiles(); //call getFiles() function on initial state.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Documents"),
        ),
        body: files == null
            ? Text("Searching Files")
            : ListView.builder(
                //if file/folder list is grabbed, then show here
                itemCount: files?.length ?? 0,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(files[index].path.split('/').last),
                    leading: Icon(Icons.description),
                    onTap: () {
                      // you can add Play/push code over here
                    },
                  ));
                },
              ));
  }
}
