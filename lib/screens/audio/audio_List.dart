import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_file_manager/flutter_file_manager.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
//import package files

//apply this class on home: attribute at MaterialApp()
class MyAudioList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAudioList(); //create state
  }
}

class _MyAudioList extends State<MyAudioList> {
  var files;
  var _openResult = "unknown";

  void getFiles() async {
    //asyn function to get list of files
    List<StorageInfo> storageInfo = await PathProviderEx.getStorageInfo();
    var root = storageInfo[0]
        .rootDir; //storageInfo[1] for SD card, geting the root directory
    var fm = FileManager(root: Directory(root)); //
    files = await fm.filesTree(excludedPaths: [
      "/storage/emulated/0/Android"
    ], extensions: [
      'mp3',
      '3ga',
      '3gpp',
      'aa',
      'aa3',
      'aac',
      'aax',
      'amr',
      'm4a',
      'mpc',
      'wav',
      'wma',
      'webm',
      'wv'
    ] //optional, to filter files, list only mp3 files
        );
    setState(() {}); //update the UI
  }

  Future<void> openFile(String filePath) async {
    final _result = await OpenFile.open(filePath);
    print(_result.message);

    setState(() {
      _openResult = "type=${_result.type}  message=${_result.message}";
    });
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
        title: Text("Audio"),
        // backgroundColor: Colors.redAccent
      ),
      body: files == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              //if file/folder list is grabbed, then show here
              itemCount: files?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(files[index].path.split('/').last),
                  leading: Icon(
                    Icons.audiotrack,
                    size: 35.0,
                  ),
                  onTap: () {
                    openFile(files[index].path);
                  },
                ));
              },
            ),
    );
  }
}
