class Employee {

  var id , name , unique_number , points , task_count , password;

  factory Employee.fromJson(Map<String , dynamic> json)
  {

    return Employee(id : json['emp_id'] ,name: json['name'],unique_number: json['unique_number'] , points: json['points'] , task_count:json['count'] ,password:json['password']);
  }

  Employee({required this.id , required this.name,required this.unique_number , required this.points , required this.task_count , this.password});


}

class EmployeeModel{

  List<Employee>data ;
  EmployeeModel({required this.data}) ;

  factory EmployeeModel.fromJson(Map<String , dynamic> json)
  {
    return EmployeeModel(
        data:List<Employee>.from(json['user'].map((p)=>Employee.fromJson(p))).toList()
    ) ;
  }
}
