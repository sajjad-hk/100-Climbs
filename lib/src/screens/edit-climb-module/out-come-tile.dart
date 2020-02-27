import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class OutComeTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    return Container(
      height: screens['EDIT_CLIMB']['BUTTON_HEIGHT_2']
          [LayoutUtils(context).screenSize],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              child: NewCustomRadio.row(
                value: OutComeEnum.success,
                groupValue: climb?.outCome,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Yup',
                fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                    [LayoutUtils(context).screenSize],
                iconProvider: AppIcons.smile,
                iconSize: screens['EDIT_CLIMB']['ICON_SIZE_2']
                    [LayoutUtils(context).screenSize],
                onChanged: (val) {
                  store.updateClimb(updateOutCome(climb, val));
                },
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(left: 4),
              child: NewCustomRadio.row(
                value: OutComeEnum.failure,
                groupValue: climb?.outCome,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Nope',
                fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                    [LayoutUtils(context).screenSize],
                iconProvider: AppIcons.sad,
                iconSize: screens['EDIT_CLIMB']['ICON_SIZE_2']
                    [LayoutUtils(context).screenSize],
                onChanged: (val) {
                  store.updateClimb(updateOutCome(climb, val));
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Climb updateOutCome(Climb climb, OutComeEnum value) {
    return climb.rebuild((c) => c..outCome = value);
  }
}
