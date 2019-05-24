enum OutCome { SUCCESS, FAILURE }
enum GradingStyle { FRENCH, POLISH }
enum BelayingStyle { LEAD, AUTO, TOPROPE }
enum Closure { ONSIGHT, FLASH }

class ClimbingRoute {
  String outCome;
  String gradingStyle;
  String grade;
  String belayingStyle;
  String closure;
  List<String> tags;

  ClimbingRoute(
      {this.outCome,
      this.gradingStyle,
      this.grade,
      this.belayingStyle,
      this.closure,
      this.tags});

  factory ClimbingRoute.fromJson(Map<String, dynamic> jsonData) {
    return ClimbingRoute(
        outCome: 'SUCCESS',
        gradingStyle: 'FRENCH',
        grade: '6a',
        belayingStyle: 'LEAD',
        closure: 'FLASH',
        tags: []);
  }
}
