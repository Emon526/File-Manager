import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:disk_space/disk_space.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _diskSpace = 0;
  double? totalDiskSpace = 0;
  @override
  void initState() {
    super.initState();
    initDiskSpace();
  }

  Future<void> initDiskSpace() async {
    double diskSpace = 0;

    diskSpace = (await DiskSpace.getFreeDiskSpace)!;
    double? totalSpace = await DiskSpace.getTotalDiskSpace;
    if (!mounted) return;

    setState(() {
      _diskSpace = diskSpace / 1024;
      totalDiskSpace = (totalSpace! / 1024);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Center(
              child: Text('Available (GB): ${_diskSpace.toStringAsFixed(2)}\n'),
            ),
            Center(
              child: Text('Total (GB): ${_diskSpace.toStringAsFixed(2)}\n'),
            ),
          ],
        ),
      ),
    );
  }
}
