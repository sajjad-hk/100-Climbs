enum OutCome { SUCCESS, FAILURE }
enum GradingStyle { FRENCH, POLISH }
enum BelayingStyle { LEAD, AUTO, TOPROPE }
enum Closure { ONSIGHT, FLASH }

class ClimbingRoute {
  String outCome;
  String gradingStyle;
  String grade;
  String belayingStyle;
  List<String> closures;
  List<String> tags;

  ClimbingRoute(
      {this.outCome,
      this.gradingStyle,
      this.grade,
      this.belayingStyle,
      this.closures,
      this.tags});

  factory ClimbingRoute.fromJson(Map<String, dynamic> jsonData) {
    return ClimbingRoute(
        outCome: 'SUCCESS',
        gradingStyle: 'FRENCH',
        grade: '6a',
        belayingStyle: 'LEAD',
        closures: ['FLASH'],
        tags: []);
  }
}
