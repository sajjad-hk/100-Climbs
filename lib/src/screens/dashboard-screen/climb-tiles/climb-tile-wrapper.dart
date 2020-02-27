import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class ClimbTileWrapper extends StatelessWidget {
  final ViewClimb viewClimb;

  ClimbTileWrapper(this.viewClimb) : super();

  @override
  Widget build(BuildContext context) {
    Widget content = ClimbTileContent(viewClimb);

    if (viewClimb.isFailure && !viewClimb.isSelected)
      content = failureWrapper(content, context);
    if (viewClimb.isSelected) content = selectedWrapper(content);

    return Container(
      padding: const EdgeInsets.all(6.0),
      child: content,
    );
  }

  Widget failureWrapper(Widget content, BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        strokeWidth: 3.0,
        color: AppColors.coolGrey,
        dashLength: 4.5,
        skipLength: screens['DASHBOARD']['FAILURE_DASHLINE_SKIP']
            [LayoutUtils(context).screenSize],
      ),
      child: content,
    );
  }

  Widget selectedWrapper(Widget content) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.green,
        ),
      ),
      child: content,
    );
  }
}
