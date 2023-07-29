class Task{

  var num , task_date , title , description , deliver_date  , child_name , check , emp_id , notes;


  factory Task.fromJson(Map<String , dynamic> json)
  {

    return Task(num : json['id'] ,title: json['title'],description: json['description'],check: json['check']
         ,deliver_date: json['hours'] , task_date: json['created_at'] , child_name:json['child_name'] , notes:json['notes']);
  }

  Task({required this.num , required this.title  , required this.description , required this.check , required this.deliver_date , required this.task_date ,required this.child_name , required this.notes}) ;
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