import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class BelayStyleTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    return Row(
      children: <Widget>[
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(right: 4),
            child: AspectRatio(
              aspectRatio: 1,
              child: NewCustomRadio.col(
                value: BelayingStyleEnum.lead,
                groupValue: climb.belayingStyle,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.lead,
                label: 'Lead',
                fontSize: 16,
                iconSize: 40,
                onChanged: (val) =>
                    store.updateClimb(updateBelayStyle(climb, val)),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 4, right: 4),
            child: AspectRatio(
              aspectRatio: 1,
              child: NewCustomRadio.col(
                value: BelayingStyleEnum.auto,
                groupValue: climb.belayingStyle,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.auto,
                iconSize: 40,
                label: 'Auto',
                fontSize: 16,
                onChanged: (val) =>
                    store.updateClimb(updateBelayStyle(climb, val)),
              ),
            ),
          ),
        ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(left: 4),
            child: AspectRatio(
              aspectRatio: 1,
              child: NewCustomRadio.col(
                value: BelayingStyleEnum.toprope,
                groupValue: climb.belayingStyle,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.topRope,
                iconSize: 40,
                label: 'Toprope',
                fontSize: 16,
                onChanged: (val) =>
                    store.updateClimb(updateBelayStyle(climb, val)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Climb updateBelayStyle(Climb climb, BelayingStyleEnum value) {
    return climb.rebuild((c) => c..belayingStyle = value);
  }
}
