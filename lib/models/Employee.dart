import 'dart:convert';

EmployeeModel tableFromJson(String str) =>
    EmployeeModel.toObject(json.decode(str));

class EmployeeModel{

  Employee data ;
  factory EmployeeModel.toObject(Map<String , dynamic> json)
  {
    return EmployeeModel(data : Employee.toObject(json['data']), );
  }
  EmployeeModel({required this.data });

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),

  };
}
class Employee {
  var id , name , unique_number , points , task_count , password , email;

  factory Employee.toObject(Map<String , dynamic> json)
  {

    return Employee(id : json['emp_id'] ,name: json['name'],unique_number: json['unique_number'] , points: json['points'] , task_count:json['count'] ,password:json['password'] , email:json['email']);
  }

  Employee({required this.id , required this.name,required this.unique_number , required this.points , required this.task_count , this.password , this.email});

  factory Employee.fromJson(Map<String , dynamic> json)
  {

    return Employee(id : json['id'] ,
      name : json['name']   , unique_number : json['unique_number'] ,
      points : json['points'] , task_count : json['count'], password:json['password'] , email: json['email']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id.toJson(),
    "name": name.toJson(),
    "email": email.toJson(),
    "unique_number": unique_number.toJson(),
    "points": points.toJson(),
    'count': task_count.toJson(),
    'password': password.toJson(),

  };
}

class EmployeListModel{

  List<Employee>data ;
  EmployeListModel({required this.data}) ;

  factory EmployeListModel.fromJson(Map<String , dynamic> json)
  {
    return EmployeListModel(
        data:List<Employee>.from(json['data'].map((p)=>Employee.fromJson(p))).toList()
    ) ;
  }
}
