
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progment_task/bloc/successbloc/booking_event.dart';
import 'package:progment_task/bloc/successbloc/booking_state.dart';
import 'package:progment_task/bloc/successbloc/booking_bloc.dart';
import 'package:progment_task/bloc/villagesec_bloc.dart';
import 'package:progment_task/model/namemodel.dart';
import 'package:progment_task/model/villagesec.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class DropDownScreen extends StatefulWidget {
  const DropDownScreen({Key key}) : super(key: key);

  @override
  _DropDownScreenState createState() => _DropDownScreenState();
}

class _DropDownScreenState extends State<DropDownScreen> {
  BookingBolc bookingBolc;
  VillageSecBloc villageSecBloc = VillageSecBloc();
  VillageSecModel village;
  List<VillageSecModel>villageList;
  List<NameModel>nameList;
  NameModel name;

  @override
  void initState() {
    // TODO: implement initState
    villageSecBloc.fetchVillageSecData();
    villageSecBloc.fetchNamesData();
    bookingBolc = BlocProvider.of<BookingBolc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingBolc, BookingState>(
      listener: (BuildContext context, BookingState state) {
        if (state is BookingLoading) {
          return CircularProgressIndicator();
        } else if (state is BookingSuccess) {
          return showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text("Booking Status"),
              content: Text(state.dataModel.msg.toString()),
              actions: [
                MaterialButton(onPressed: (){
                  Navigator.pop(context);
                },child: Text("No"),),
                MaterialButton(onPressed: (){
                  Navigator.pop(context);
                },child: Text("yes"),)
              ],
            );
          });
        } else if (state is BookingFailure) {
          return showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: Text("Booking Status"),
              content: Text(state.errorMessage..toString()),
              actions: [
                MaterialButton(onPressed: (){
                  Navigator.pop(context);
                },child: Text("No"),),
                MaterialButton(onPressed: (){
                  Navigator.pop(context);
                },child: Text("yes"),)
              ],
            );
          });
        }
      },
      child: BlocBuilder<BookingBolc,BookingState>(
        builder: ( BuildContext context, BookingState state) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  StreamBuilder(
                      stream: villageSecBloc.getVillagesSecList,
                      builder: (context,
                          AsyncSnapshot<List<VillageSecModel>> snapshot) {
                        if(snapshot.hasData){
                          villageList=snapshot.data;
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child:(snapshot.data==null) ?Text("No data to show"):SearchableDropdown.single(
                            items: villageList[0].data.map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item.villagesec),
                            ) ).toList(),
                            value: village,
                            hint: "Select VillageSec",
                            searchHint: "Search VillageSec",
                            onChanged: (value) {
                              setState(() {
                                village = value;
                              });
                            },
                            isExpanded: true,
                        ),
                          );}
                        if(snapshot.hasError){
                          Text(" data failed to load");
                        }
                          return CircularProgressIndicator();
                      }),
                  SizedBox(height: 25,),
                  StreamBuilder(
                      stream: villageSecBloc.getNamesList,
                      builder:
                          (context, AsyncSnapshot<List<NameModel>> snapshot) {
                       if(snapshot.hasData) {
                         nameList=snapshot.data;
                         Container(
                           height: 50,
                           width: MediaQuery.of(context).size.width,
                           child:(snapshot.data==null) ?Text("No data to show"): SearchableDropdown.single(
                             items: nameList[0].data.map((item) =>
                                 DropdownMenuItem(
                                   value: item,
                                   child: Text(item.name),
                                 )).toList(),
                             value: name,
                             hint: "Select Name",
                             searchHint: "Search Name",
                             onChanged: (value) {
                               setState(() {
                                 village = value;
                               });
                             },
                             isExpanded: true,
                           ),
                         );
                       }
                       if(snapshot.hasError){
                         Text(" data failed to load");
                       }
                       return CircularProgressIndicator();
                      }),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            BlocProvider.of<BookingBolc>(context)
                                .add(SubmitButtonPressed(
                              village: village.data[0].id.toString(),
                              name: name.data[0].id.toString(),
                            ));
                          },
                          child: Text("Submit",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
