
enum OutCome { SUCCESS, FAILURE }
enum GradingStyle { FRENCH, POLISH }
enum BelayingStyle { LEAD, AUTO, TOPROPE }
enum Closure { ONSIGHT, FLASH }

class Route {
  String outCome;
  String gradingStyle;
  String grade;
  String belayingStyle;
  String closure;
  List<String> tags;

  Route(
      {this.outCome,
      this.gradingStyle,
      this.grade,
      this.belayingStyle,
      this.closure,
      this.tags});

  factory Route.fromJson(Map<String, dynamic> jsonData) {
    return Route(
        outCome: 'SUCCESS',
        gradingStyle: 'FRENCH',
        grade: '6a',
        belayingStyle: 'LEAD',
        closure: 'FLASH',
        tags: []);
  }
}
