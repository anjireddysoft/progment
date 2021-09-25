import 'package:progment_task/model/namemodel.dart';
import 'package:progment_task/model/villagesec.dart';
import 'package:progment_task/repository/villageSecRepository.dart';
import 'package:rxdart/rxdart.dart';

class VillageSecBloc {
  final villagedata = PublishSubject<List<VillageSecModel>>();
  final namesdata = PublishSubject<List<NameModel>>();
  VillageSecRepository repository = VillageSecRepository();

  Stream<List<NameModel>> get getNamesList => namesdata.stream;

  Stream<List<VillageSecModel>> get getVillagesSecList => villagedata.stream;

  fetchVillageSecData() async {
    List<VillageSecModel> villages = await repository.getVillageSecListData();
    print("------------------------------------------------a");
    villagedata.sink.add(villages);

  }

  fetchNamesData() async {
    List<NameModel> names = await repository.getNamesList();
    print("------------------------------------------------a");
    namesdata.sink.add(names);

  }

  dispose() {
    villagedata.close();
    namesdata.close();
  }
}
