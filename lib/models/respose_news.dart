import 'package:api_vidio/models/news.dart';

class ResposeNews {
  String? messages;
  int? total;
  List<Data>? data;

  ResposeNews({this.messages, this.total, this.data});

  ResposeNews.fromJson(Map<String, dynamic> json) {
    messages = json['messages'];
    total = json['total'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messages'] = this.messages;
    data['total'] = this.total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

