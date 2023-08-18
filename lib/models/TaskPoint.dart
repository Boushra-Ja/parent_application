
import 'dart:convert';

TaskPointModel tableFromJson2(String str) =>
    TaskPointModel.toObject(json.decode(str));

class TaskPointModel{

  TaskPoint data ;
  factory TaskPointModel.toObject(Map<String , dynamic> json)
  {
    return TaskPointModel(data : TaskPoint.toObject(json['data']), );
  }
  TaskPointModel({required this.data });

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),

  };
}
class TaskPoint {
  var task_name , points ,task_id ;

  factory TaskPoint.toObject(Map<String , dynamic> json)
  {

    return TaskPoint(task_name : json['task_name'] ,points: json['points'] , task_id:json['task_id']);
  }

  TaskPoint({required this.task_name , required this.points ,required this.task_id});

  factory TaskPoint.fromJson(Map<String , dynamic> json)
  {

    return TaskPoint(task_name : json['task_name'] ,
        points : json['points'] ,task_id:json['task_id']
    );
  }

  Map<String, dynamic> toJson() => {
    "task_name": task_name.toJson(),
    "points": points.toJson(),
    "task_id" : task_id.toJson()


  };
}
