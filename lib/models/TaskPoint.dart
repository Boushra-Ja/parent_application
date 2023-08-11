
import 'dart:convert';

import 'package:alrazi_project/models/Task.dart';

TaskPointModel tableFromJson(String str) =>
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
  var task_name , points ;

  factory TaskPoint.toObject(Map<String , dynamic> json)
  {

    return TaskPoint(task_name : json['task_name'] ,points: json['points']);
  }

  TaskPoint({required this.task_name , required this.points });

  factory TaskPoint.fromJson(Map<String , dynamic> json)
  {

    return TaskPoint(task_name : json['task_name'] ,
        points : json['points']
    );
  }

  Map<String, dynamic> toJson() => {
    "task_name": task_name.toJson(),
    "points": points.toJson(),

  };
}
