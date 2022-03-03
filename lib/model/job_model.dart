// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobModel {
  final String id;
  final String nameRecord;
  final String jobName;
  final String detailJob;
  final String factoryKey;
  final String agree;
  final String item;
  final String addDate;
  final String qRcode;
  final String pathImage;

  JobModel(
      this.id,
      this.nameRecord,
      this.jobName,
      this.detailJob,
      this.factoryKey,
      this.agree,
      this.item,
      this.addDate,
      this.qRcode,
      this.pathImage);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nameRecord': nameRecord,
      'jobName': jobName,
      'detailJob': detailJob,
      'factoryKey': factoryKey,
      'agree': agree,
      'item': item,
      'addDate': addDate,
      'qRcode': qRcode,
      'pathImage': pathImage,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      map['id'] as String,
      map['nameRecord'] as String,
      map['jobName'] as String,
      map['detailJob'] as String,
      map['factoryKey'] as String,
      map['agree'] as String,
      map['item'] as String,
      map['addDate'] as String,
      map['qRcode'] as String,
      map['pathImage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
