
class Advice {

  var id , text , created_at;

  factory Advice.fromJson(Map<String , dynamic> json)
  {

    return Advice(id : json['id'] ,text: json['text'],created_at: json['created_at'] );
  }

  Advice({required this.id , required this.text,required this.created_at });


}

class AdviceModel{

  List<Advice>data ;
  AdviceModel({required this.data}) ;

  factory AdviceModel.fromJson(Map<String , dynamic> json)
  {
    return AdviceModel(
        data:List<Advice>.from(json['data'].map((p)=>Advice.fromJson(p))).toList()
    ) ;
  }
}
