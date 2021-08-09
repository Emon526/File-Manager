import 'dart:io';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:photo_gallery/photo_gallery.dart';

class ImageController extends GetxController {
  // all albums will store in _albums
  List<Album> _albums = [];
  MediaPage? _mediaPage;

  List<Medium> _allVideo = [];
  List<Medium> _allImages = [];

  var count = 0.obs;
  var _openResult = "unknown".obs;

  @override
  void onInit() {
    super.onInit();
    initAlbums();
  }

  countUpdate() {
    count++;
  }

  // initializing albums
  void initAlbums() async {
    // getting all albums
    _albums = await PhotoGallery.listAlbums(mediumType: MediumType.video);
    _mediaPage = await _albums.first.listMedia();
    _allVideo = _mediaPage!.items;

    _albums = await PhotoGallery.listAlbums(mediumType: MediumType.image);
    _mediaPage = await _albums.first.listMedia();
    _allImages = _mediaPage!.items;
    // getting all videos

    print("Albums get");
    update();
  }

  Future<void> openFileWithDefaultApp(Medium medium) async {
    File file = await medium.getFile();

    OpenResult _result = await OpenFile.open(file.path);

    print("Result message: " + _result.message);
    _openResult.value = "type=${_result.type}  message=${_result.message}";
  }

  // return albums
  List<Album>? get getAlbums => this._albums;

  List<Medium>? get getAllVideo => this._allVideo;
  List<Medium>? get getAllImages => this._allImages;
}
