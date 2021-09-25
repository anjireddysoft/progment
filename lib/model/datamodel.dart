class DataModel {
  bool status;
  String msg;
  String imageid;

  DataModel({this.status, this.msg, this.imageid});

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['Msg'];
    imageid = json['Imageid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['Msg'] = this.msg;
    data['Imageid'] = this.imageid;
    return data;
  }
}