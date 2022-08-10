// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final DateTime publicationTime;
  final DateTime? updateTime;

  NewsModel(
    this.id,
    this.title,
    this.description,
    this.image,
    this.publicationTime,
    this.updateTime,
  );

  @override
  factory NewsModel.fromJson(Map map) {
    return NewsModel(
      map['id'],
      map['title'],
      map['description'],
      map['image'],
      DateTime.fromMicrosecondsSinceEpoch(map['publicationTime']),
      map['updateTime'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(int.parse(map['updateTime']))
          : null,
    );
  }

  Map? toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, description: $description, image: $image, publicationTime: $publicationTime, updateTime: $updateTime)';
  }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'title': title,
  //     'description': description,
  //     'image': image,
  //     'publicationTime': publicationTime.millisecondsSinceEpoch,
  //     'updateTime': updateTime?.millisecondsSinceEpoch,
  //   };
  // }

  // factory NewsModel.fromMap(Map<String, dynamic> map) {
  //   return NewsModel(
  //     map['id'] as int,
  //     map['title'] as String,
  //     map['description'] as String,
  //     map['image'] as String,
  //     DateTime.fromMillisecondsSinceEpoch(map['publicationTime'] as int),
  //     map['updateTime'] != null ? DateTime.fromMillisecondsSinceEpoch(map['updateTime'] as int) : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

}
