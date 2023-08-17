import 'dart:convert';

ReportModel tableFromJson(String str) =>
    ReportModel.toObject(json.decode(str));

class ReportModel {
  TableResault social, know, care, monotor, comm;
  var test_date,
      new_social_ratio,
      old_social_ratio,
      new_montor_ratio,
      old_montor_ratio,
      new_care_ratio,
      old_care_ratio,
      new_comm_ratio,
      old_comm_ratio,
      new_know_ratio,
      old_know_ratio,
  section , infection;

  ReportModel(
      {required this.test_date,
      required this.new_social_ratio,
      required this.old_social_ratio,
      required this.new_montor_ratio,
      required this.old_montor_ratio,
      required this.new_care_ratio,
      required this.old_care_ratio,
      required this.new_comm_ratio,
      required this.old_comm_ratio,
      required this.new_know_ratio,
      required this.old_know_ratio,
      required this.social,
      required this.know,
      required this.care,
      required this.monotor,
      required this.comm , required this.section , required this.infection});

  factory ReportModel.toObject(Map<String, dynamic> json) =>
      ReportModel(
        test_date: json['test_date'],
        new_social_ratio: json['new_social_ratio'],
        old_social_ratio: json['old_social_ratio'],
        new_montor_ratio: json['new_montor_ratio'],
        old_montor_ratio: json['old_montor_ratio'],
        new_care_ratio: json['new_care_ratio'],
        old_care_ratio: json['old_care_ratio'],
        new_comm_ratio: json['new_comm_ratio'],
        old_comm_ratio: json['old_comm_ratio'],
        new_know_ratio: json['new_know_ratio'],
        old_know_ratio: json['old_know_ratio'],
        social: TableResault.toObject(json['social']),
        know: TableResault.toObject(json['know']),
        care: TableResault.toObject(json['care']),
        monotor: TableResault.toObject(json['monotor']),
        comm: TableResault.toObject(json['comm']),
        section:json['section'] ,
          infection:json['infection']

      );

  Map<String, dynamic> toJson() => {
        "social": social.toJson(),
        "know": know.toJson(),
        "comm": comm.toJson(),
        "montor": monotor.toJson(),
        "care": care.toJson(),
        'test_date': test_date.toJson(),
        'new_social_ratio': new_social_ratio.toJson(),
        'old_social_ratio': old_social_ratio.toJson(),
        'new_montor_ratio': new_montor_ratio.toJson(),
        'old_montor_ratio': old_montor_ratio.toJson(),
        'new_care_ratio': new_care_ratio.toJson(),
        'old_care_ratio': old_care_ratio.toJson(),
        'new_comm_ratio': new_comm_ratio.toJson(),
        'old_comm_ratio': old_comm_ratio.toJson(),
        'new_know_ratio': new_know_ratio.toJson(),
        'old_know_ratio': old_know_ratio.toJson(),
    'section' :section.toJson() ,
    'infection' :infection.toJson()
      };
}

class TableResault {
  var age, dimenssion, ratio, t_age, level;

  TableResault(
      {required this.age,
      required this.dimenssion,
      required this.ratio,
      required this.t_age,
      required this.level});

  factory TableResault.toObject(Map<String, dynamic> json) => TableResault(
      age: json['year'],
      dimenssion: json['dimantion'],
      ratio: json['performance_ratio'],
      t_age: json['month'],
      level: json['performance']);

  Map<String, dynamic> toJson() => {
        "year": age,
        "month": t_age,
        "dimantion": dimenssion,
        "performance_ratio": ratio,
        'performance': level
      };
}

