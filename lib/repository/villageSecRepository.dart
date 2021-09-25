

import 'package:progment_task/api_provider/api_provider.dart';
import 'package:progment_task/model/namemodel.dart';
import 'package:progment_task/model/villagesec.dart';

class VillageSecRepository {
  ApiProvider apiProvider = ApiProvider();

  Future<List<VillageSecModel>> getVillageSecListData() async {
    return apiProvider.getVillages();

  }

  Future<List<NameModel>> getNamesList() async {
    return apiProvider.getNames();
  }

}
