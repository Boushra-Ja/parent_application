import 'package:intl/intl.dart';

class Notification{

  int id   ,  receiver_id ;
  String title ,message   ,created_at  ;
  var type , need_id ;

  factory Notification.fromJson(Map<String , dynamic> json)
  {
    DateTime date = DateTime.parse(json['created_at']);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);


    return Notification(id : json['id'] ,
        receiver_id : json['receiver_id']   , title : json['title'] ,
        message : json['message'] , created_at : formattedDate, type:json['type'],need_id:json['need_id']
    );
  }

  Notification({required this.id , required this.receiver_id  ,
    required this.title , required this.message , required this.created_at  ,required this.type , required this.need_id
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