import 'dart:convert';

TaskObjModel tableFromJson(String str) =>
    TaskObjModel.toObject(json.decode(str));

class TaskObjModel{

  Task data ;
  factory TaskObjModel.toObject(Map<String , dynamic> json)
  {
    return TaskObjModel(data : Task.toObject(json['data']), );
  }
  TaskObjModel({required this.data });

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),

  };
}

class Task{

  var num , task_date , title , description , deliver_date  , child_name , check , emp_id , notes , start , start_double;


  factory Task.toObject(Map<String , dynamic> json)
  {

    return Task(num : json['id'] ,title: json['title'],description: json['description'],check: json['check']
        ,deliver_date: json['hours'] , task_date: json['created_at'] , child_name:json['child_name'] ,
        notes:json['notes'] , start:json['start'] ,start_double:0);
  }
  factory Task.fromJson(Map<String , dynamic> json)
  {

    String timeString = json['start'] ;
    DateTime time = DateTime.parse("2023-08-13 $timeString"); // يمكنك استخدام أي تاريخ متخيل هنا

    double timeInDecimal = time.hour + (time.minute / 60) + (time.second / 3600);

    return Task(num : json['id'] ,title: json['title'],description: json['description'],check: json['check']
         ,deliver_date: json['hours'] , task_date: json['created_at'] , child_name:json['child_name'] ,
        notes:json['notes'] , start:json['start'] , start_double:timeInDecimal);
  }

  Task({required this.num , required this.title  , required this.description ,
    required this.check , required this.deliver_date , required this.task_date ,
    required this.child_name , required this.notes , required this.start ,required this.start_double}) ;

  Map<String, dynamic> toJson() => {
    "id": num.toJson(),
    "title": title.toJson(),
    "description": description.toJson(),
    "check": check.toJson(),
    "hours": deliver_date.toJson(),
    'created_at': task_date.toJson(),
    'child_name': child_name.toJson(),
    'notes': notes.toJson(),
    'start': start.toJson(),


  };
}

class TaskModel{

  List<Task>data ;
  TaskModel({required this.data}) ;

  factory TaskModel.fromJson(Map<String , dynamic> json)
  {
    return TaskModel(
        data:List<Task>.from(json['data'].map((p)=>Task.fromJson(p))).toList()
    ) ;
  }
}