import 'package:intl/intl.dart';

class Appoinment{

  int id   , hours  ;
  var app_date ,start_app    ;

  factory Appoinment.fromJson(Map<String , dynamic> json)
  {

    return Appoinment(id : json['id'] ,
      hours : json['hours']   , app_date : json['app_date'] ,
      start_app : json['start']
    );
  }

  Appoinment({required this.id , required this.hours  ,
    required this.app_date , required this.start_app
  });

}


class AppoinmentModel{

  List<Appoinment>data ;
  AppoinmentModel({required this.data}) ;

  factory AppoinmentModel.fromJson(Map<String , dynamic> json)
  {
    return AppoinmentModel(
        data:List<Appoinment>.from(json['data'].map((p)=>Appoinment.fromJson(p))).toList()
    ) ;
  }
}