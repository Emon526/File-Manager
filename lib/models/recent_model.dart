class RecentModel {
  final String path;
  final String
      key; // not an actual Key but will take the String value of a UniqueKey

  RecentModel({required this.key, required this.path});

  factory RecentModel.fromJson(Map<String, dynamic> json) {
    return RecentModel(
      key: json['key'],
      path: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.path;
    return data;
  }

  // RecentModel.fromJson(Map<String, dynamic> json)
  //     : path = json['name'],
  //       key = json['key'];

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': path,
  //     'key': key,
  //   };
  // }
}
