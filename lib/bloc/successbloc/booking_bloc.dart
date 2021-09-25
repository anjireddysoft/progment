import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progment_task/bloc/successbloc/booking_event.dart';
import 'package:progment_task/bloc/successbloc/booking_state.dart';
import 'package:progment_task/model/datamodel.dart';
import 'package:progment_task/repository/SuccessRepository.dart';

class BookingBolc extends Bloc<BookingEvent,BookingState>{

  final BookingRepository bookingRepository;
BookingBolc({this.bookingRepository}) : super(null);
  @override
  Stream<BookingState> mapEventToState(BookingEvent event)async* {
    if(event is SubmitButtonPressed){

      yield BookingLoading();
      DataModel dataModel= await bookingRepository.getSuccessMessage(name: event.name,village: event.village);
      if(dataModel.status.toString().contains("true")){

        yield BookingSuccess(dataModel: dataModel);
      }
      else{

        yield BookingFailure(errorMessage: dataModel.msg);
      }
    }

  }
}