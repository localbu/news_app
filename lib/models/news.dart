class Data {
  String? title;
  String? link;
  String? contentSnippet;
  String? isoDate;
  Image? image;

  Data({this.title, this.link, this.contentSnippet, this.isoDate, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    contentSnippet = json['contentSnippet'];
    isoDate = json['isoDate'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['contentSnippet'] = this.contentSnippet;
    data['isoDate'] = this.isoDate;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}

class Image {
  String? small;
  String? large;

  Image({this.small, this.large});

  Image.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    return data;
  }
}
