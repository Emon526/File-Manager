import 'package:get/get.dart';
import 'package:photo_gallery/photo_gallery.dart';

class ImageController extends GetxController {
  // all albums will store in _albums
  List<Album> _albums = [];
  MediaPage? _mediaPage;

  List<Medium> _allVideo = [];
  List<Medium> _allImages = [];

  var count = 0.obs;

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

  getFile(Medium file) async{
    return await file.getFile();
  }
  getThumbnail(Medium file) async{
    return await file.getThumbnail();
  }

  // return albums
  List<Album>? get getAlbums => this._albums;

  List<Medium>? get getAllVideo => this._allVideo;
  List<Medium>? get getAllImages => this._allImages;
}
