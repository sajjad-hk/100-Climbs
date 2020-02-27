import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class TileSection extends StatelessWidget {
  final Widget content;
  final String title;
  final bool withMargin;

  const TileSection(
      {Key key, @required this.content, this.title, this.withMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        sides: SideBorders(
          leftSide: false,
          rightSide: false,
          topSide: false,
          bottomSide: true,
        ),
        color: AppColors.black30,
        strokeWidth: 1.0,
        dashLength: 4.5,
        skipLength: 3.0,
      ),
      child: Container(
        margin: withMargin
            ? const EdgeInsets.only(top: 20, right: 15, bottom: 20, left: 15)
            : const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: withMargin
                  ? const EdgeInsets.only(bottom: 15)
                  : const EdgeInsets.only(
                      top: 20, right: 15, bottom: 15, left: 15),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black30,
                ),
              ),
            ),
            Container(
              margin: withMargin
                  ? const EdgeInsets.all(0)
                  : const EdgeInsets.only(bottom: 15),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
