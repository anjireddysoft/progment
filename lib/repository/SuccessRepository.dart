 import 'package:progment_task/api_provider/api_provider.dart';
import 'package:progment_task/model/datamodel.dart';

class BookingRepository{
  ApiProvider provider=ApiProvider();
   Future<DataModel> getSuccessMessage({String name, String village}) async {
     return provider.getData(name: name,village: village );
   }
}