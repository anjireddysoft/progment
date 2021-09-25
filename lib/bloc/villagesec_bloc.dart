import 'package:progment_task/model/namemodel.dart';
import 'package:progment_task/model/villagesec.dart';
import 'package:progment_task/repository/villageSecRepository.dart';
import 'package:rxdart/rxdart.dart';

class VillageSecBloc {
  final villagedata = PublishSubject<VillageSecModel>();
  final namesdata = PublishSubject<NameModel>();
  VillageSecRepository repository = VillageSecRepository();

  Stream<NameModel> get getNamesList => namesdata.stream;

  Stream<VillageSecModel> get getVillagesSecList => villagedata.stream;

  fetchVillageSecData() async {
    VillageSecModel villages = await repository.getVillageSecListData();
    print("------------------------------------------------a");
    villagedata.sink.add(villages);

  }

  fetchNamesData() async {
    NameModel names = await repository.getNamesList();
    print("------------------------------------------------a");
    namesdata.sink.add(names);

  }

  dispose() {
    villagedata.close();
    namesdata.close();
  }
}
