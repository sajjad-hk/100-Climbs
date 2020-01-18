import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class ClimbTileContentWithRibbon extends StatelessWidget {
  final ViewClimb climb;

  const ClimbTileContentWithRibbon({Key key, this.climb}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final currentClimb = climb.climb;
    return LayoutBuilder(
      builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColors.getGradeColor(climb.climb.grade),
                width: 6,
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            currentClimb.grade,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: TileDetails(
                            belayingStyle: currentClimb.belayingStyle,
                            closure: currentClimb.closure,
                          ),
                        ),
                      ],
                    ),
                    if (currentClimb.tags.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(left: 4, bottom: 4),
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 5.0,
                          children: <Widget>[
                            for (String tag in currentClimb.tags)
                              TagInfoItem(
                                tagText: tag,
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: climb.isSelected
                              ? AppColors.green
                              : AppColors.paleGrey2,
                        ),
                        child: Icon(
                          Icons.done,
                          size: 32,
                          color: AppColors.getClimbingRouteOutcomeColor(
                              currentClimb.outCome),
                        ),
                      ),
                      onPressed: () => store.selectClimb(currentClimb),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
