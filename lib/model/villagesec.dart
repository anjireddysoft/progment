class VillageSecModel {
  bool status;
  List<Data> data;

  VillageSecModel({this.status, this.data});

  VillageSecModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Data'] != null) {
      data = new List<Data>();
      json['Data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['Data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String villagesec;

  Data({this.id, this.villagesec});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    villagesec = json['villagesec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['villagesec'] = this.villagesec;
    return data;
  }
}