class Employee {

  var id , name , unique_number , points , task_count;

  factory Employee.fromJson(Map<String , dynamic> json)
  {

    return Employee(id : json['emp_id'] ,name: json['name'],unique_number: json['unique_number'] , points: json['points'] , task_count:json['count']);
  }

  Employee({required this.id , required this.name,required this.unique_number , required this.points , required this.task_count});


}

class EmployeeModel{

  List<Employee>data ;
  EmployeeModel({required this.data}) ;

  factory EmployeeModel.fromJson(Map<String , dynamic> json)
  {
    return EmployeeModel(
        data:List<Employee>.from(json['data'].map((p)=>Employee.fromJson(p))).toList()
    ) ;
  }
}
