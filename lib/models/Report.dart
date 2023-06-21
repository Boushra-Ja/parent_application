class Report {
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
      old_know_ratio;

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
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
        old_know_ratio: json['old_know_ratio']);
  }

  Report(
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
      required this.old_know_ratio});
}

class ReportModel {
  List<Report> data;

  ReportModel({required this.data});

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
        data: List<Report>.from(json['data'].map((p) => Report.fromJson(p)))
            .toList());
  }
}
