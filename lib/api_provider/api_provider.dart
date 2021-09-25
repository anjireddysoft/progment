import 'dart:convert';

import 'package:http/http.dart';
import 'package:progment_task/model/datamodel.dart';
import 'package:progment_task/model/namemodel.dart';
import 'package:progment_task/model/villagesec.dart';

class ApiProvider {
  Client client = Client();
  var responseJson;
  var headers = {
    "Content_Type": "application/json",
    'Accept': 'application/json'
  };

  Future<List<VillageSecModel>> getVillages() async {
    var map = {
      "Key": "ByJxFDKBk",
      "DistrictName": "Guntur",
      "MandalName": "MEDIKONDURU"
    };
    var jsonBody = json.encode(map);
    print("---------------------------------------------------------");
    print("village Request :${jsonBody}");
    final response = await client.post(
        Uri.parse(
            "http://103.210.74.212:8081/CheyuthaServices/PracticeServices.aspx/GetScopeVoa"),
        headers: headers,
        body: jsonBody);
    if (response.body.isNotEmpty) {
      responseJson = json.decode(response.body);
    }
    print("villageResponse:${response.body}");
    print("---------------------------------------------------------");
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);

      List<VillageSecModel> villages =
          list.map((model) => VillageSecModel.fromJson(model)).toList();
      print("-------------------${villages.length}");
      return villages;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<List<NameModel>> getNames() async {

    print("------------------------------------------------a");
    var map = {
      "Key": "ByJxFDKBk",
      "DistrictName": "CHITTOOR",
      "MandalName": "BANGARUPALEM",
      "VillageSec": "TEKUMANDA"
    };
    var jsonBody = json.encode(map);
    print("NamesBody :${jsonBody}");
    final response = await client.post(
        Uri.parse(
            "https://103.210.74.212:8081/CheyuthaServices/PracticeServices.aspx/GetScopeVoaName"),
        headers: headers,
        body: jsonBody);

    responseJson = json.decode(response.body);
    print("villageResponse:${response.body}");
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);

      List<NameModel> names =
          list.map((model) => NameModel.fromJson(model)).toList();
      print("------------------------------------------------${names}");
      return names;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<DataModel> getData({String name, String village}) async {
    var map = {
      "Key": "ByJxFDKBk",
      "IntrestedInRetailBusiness": "NO",
      "IntrestedField": "None Of The Above",
      "Reason": "Other",
      "BeneficiaryId":name,
      "EntryUser": "7842820811",
      "Latitude": "17.235698",
      "Longitude": "17.985632",
      "MapAddress": "ghjdsagydsajhajd,dgjadg",
      "Secretariat": village
    };
    var jsonBody = json.encode(map);

    final response = await client.post(
        Uri.parse(
            "http://103.210.74.212:8081/CheyuthaServices/PracticeServices.aspx/SaveScopeData"),
        headers: headers,
        body: jsonBody);
    responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return DataModel.fromJson(responseJson);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
