import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/assets-content/constants.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class HorizontalGradePicker extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final grades = Constants.grades[GradingStyleEnum.french];

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final Climb climb = store.climb;
    return Container(
      height: 48,
      child: ListView.builder(
        itemCount: grades.length,
        scrollDirection: Axis.horizontal,
        controller: _controller,
        addAutomaticKeepAlives: false,
        cacheExtent: grades.length * 68.0,
        itemBuilder: (context, index) {
          if (isTheGrade(climb, index) && index > 2) {
            _controller.animateTo((index - 1.3) * 64.0,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          }
          return InkWell(
            onTap: () => store.updateClimb(updateGrade(climb, grades[index])),
            child: Container(
              margin: const EdgeInsets.all(4),
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                color: isTheGrade(climb, index)
                    ? AppColors.black30
                    : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: !isTheGrade(climb, index)
                      ? AppColors.black30
                      : Colors.transparent,
                ),
              ),
              child: Center(
                child: Text(
                  grades[index],
                  style: TextStyle(
                    color: !isTheGrade(climb, index)
                        ? AppColors.black30
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool isTheGrade(Climb climb, int index) {
    return grades[index] == climb?.grade;
  }

  Climb updateGrade(Climb climb, String value) {
    return climb.rebuild((c) => c..grade = value);
  }
}
