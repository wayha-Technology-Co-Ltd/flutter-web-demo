// To parse this JSON data, do
//
//     final covid = covidFromJson(jsonString);

import 'dart:convert';

List<Covid> covidFromJson(String str) =>
    List<Covid>.from(json.decode(str).map((x) => Covid.fromJson(x)));

String covidToJson(List<Covid> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Covid {
  Covid({
    this.cases,
    this.death,
    this.healing,
    this.negativeCase,
    this.recover,
    this.testCase,
    this.todayCase,
    // this.updateDate,
  });

  String cases;
  String death;
  String healing;
  String negativeCase;
  String recover;
  String testCase;
  String todayCase;
  // String updateDate;

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        cases: json["cases"],
        death: json["death"],
        healing: json["healing"],
        negativeCase: json["negative_case"],
        recover: json["recover"],
        testCase: json["test_case"],
        todayCase: json["today_case"],
        // updateDate: json["update_date"],
      );

  Map<String, dynamic> toJson() => {
        "cases": cases,
        "death": death,
        "healing": healing,
        "negative_case": negativeCase,
        "recover": recover,
        "test_case": testCase,
        "today_case": todayCase,
        // "update_date": updateDate,
      };
}
