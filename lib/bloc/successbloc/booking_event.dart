import 'package:equatable/equatable.dart';

abstract class BookingEvent extends Equatable{


 const BookingEvent();
}
class SubmitButtonPressed extends BookingEvent{

 final String name;
 final String village;

@override
  String toString() {
    return 'SubmitButtonPressed{name: $name, village: $village}';
  }

  SubmitButtonPressed({this.name, this.village});

  @override
  // TODO: implement props
  List<Object> get props => [name,village];
}
