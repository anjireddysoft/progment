import 'package:equatable/equatable.dart';
import 'package:progment_task/model/datamodel.dart';

abstract class BookingState extends Equatable{


 const BookingState();
}

class BookingInitial extends BookingState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class BookingLoading extends BookingState{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class BookingSuccess extends BookingState{
  DataModel dataModel;

  BookingSuccess({this.dataModel});

  @override
  // TODO: implement props
  List<Object> get props =>[ dataModel];

}
class BookingFailure extends BookingState{
  String errorMessage;

  BookingFailure({this.errorMessage});

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];

}