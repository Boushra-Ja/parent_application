import 'package:intl/intl.dart';

class Notification{

  int id   ,  receiver_id ;
  String title ,message   ,created_at  ;

  factory Notification.fromJson(Map<String , dynamic> json)
  {
    DateTime date = DateTime.parse(json['created_at']);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);


    return Notification(id : json['id'] ,
        receiver_id : json['receiver_id']   , title : json['title'] ,
        message : json['message'] , created_at : formattedDate,
    );
  }

  Notification({required this.id , required this.receiver_id  ,
    required this.title , required this.message , required this.created_at
  });

}


class NotificationModel{

  List<Notification>data ;
  NotificationModel({required this.data}) ;

  factory NotificationModel.fromJson(Map<String , dynamic> json)
  {
    return NotificationModel(
        data:List<Notification>.from(json['data'].map((p)=>Notification.fromJson(p))).toList()
    ) ;
  }
}