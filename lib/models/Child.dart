
class Child {

  var id , name , unique_number , age , phone_num , infection , section;

  factory Child.fromJson(Map<String , dynamic> json)
  {

    return Child(id : json['id'] ,name: json['name'],unique_number: json['unique_number'] , age: json['age'] , phone_num:json['phone_num'] , infection : json['infection'] , section:json['section']);
  }

  Child({required this.id , required this.name,required this.unique_number , required this.age , required this.phone_num  ,required this.infection , required this.section});


}

class ChildModel{

  List<Child>data ;
  ChildModel({required this.data}) ;

  factory ChildModel.fromJson(Map<String , dynamic> json)
  {
    return ChildModel(
        data:List<Child>.from(json['data'].map((p)=>Child.fromJson(p))).toList()
    ) ;
  }
}
