class NameModel {
  bool status;
  List<DataItem> data;

  NameModel({this.status, this.data});

  NameModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['DataItem'] != null) {
      data = new List<DataItem>();
      json['DataItem'].forEach((v) {
        data.add(new DataItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['DataItem'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataItem {
  String id;
  String name;

  DataItem({this.id, this.name});

  DataItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
