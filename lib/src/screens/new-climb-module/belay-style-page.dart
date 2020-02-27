import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class BelayStyle extends StatelessWidget {
  final GestureTapCallback autoNext;

  BelayStyle({@required this.autoNext});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: Container(
            child: WizardPageTitle(
              title: 'Belay',
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: screens['PAGE_BELAY_STYLE']['BUTTON_WIDTH']
                    [LayoutUtils(context).screenSize],
                height: screens['PAGE_BELAY_STYLE']['BUTTON_HEIGHT']
                    [LayoutUtils(context).screenSize],
                padding: const EdgeInsets.only(bottom: 10),
                margin: const EdgeInsets.only(bottom: 10, top: 30),
                child: NewCustomRadio.row(
                  label: 'Lead',
                  fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                      [LayoutUtils(context).screenSize],
                  value: BelayingStyleEnum.valueOf('lead'),
                  groupValue: climb.belayingStyle,
                  iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                      [LayoutUtils(context).screenSize],
                  iconProvider: AppIcons.lead,
                  checkedContentColor: Colors.white,
                  checkedBgColor: AppColors.black30,
                  unCheckedBgColor: Colors.transparent,
                  onChanged: (val) {
                    store.updateClimb(updateBelayingStyle(climb, val));
                    autoNext();
                  },
                ),
              ),
              Container(
                width: screens['PAGE_BELAY_STYLE']['BUTTON_WIDTH']
                    [LayoutUtils(context).screenSize],
                height: screens['PAGE_BELAY_STYLE']['BUTTON_HEIGHT']
                    [LayoutUtils(context).screenSize],
                padding: const EdgeInsets.only(bottom: 10),
                margin: const EdgeInsets.only(bottom: 10),
                child: NewCustomRadio.row(
                  label: 'Auto',
                  fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                      [LayoutUtils(context).screenSize],
                  value: BelayingStyleEnum.valueOf('auto'),
                  groupValue: climb.belayingStyle,
                  iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                      [LayoutUtils(context).screenSize],
                  iconProvider: AppIcons.auto,
                  checkedContentColor: Colors.white,
                  checkedBgColor: AppColors.black30,
                  unCheckedBgColor: Colors.transparent,
                  onChanged: (val) {
                    store.updateClimb(updateBelayingStyle(climb, val));
                    autoNext();
                  },
                ),
              ),
              Container(
                width: screens['PAGE_BELAY_STYLE']['BUTTON_WIDTH']
                    [LayoutUtils(context).screenSize],
                height: screens['PAGE_BELAY_STYLE']['BUTTON_HEIGHT']
                    [LayoutUtils(context).screenSize],
                padding: const EdgeInsets.only(bottom: 10),
                margin: const EdgeInsets.only(bottom: 10),
                child: NewCustomRadio.row(
                  label: 'Toprope',
                  fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                      [LayoutUtils(context).screenSize],
                  value: BelayingStyleEnum.valueOf('toprope'),
                  groupValue: climb.belayingStyle,
                  iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                      [LayoutUtils(context).screenSize],
                  iconProvider: AppIcons.topRope,
                  checkedContentColor: Colors.white,
                  checkedBgColor: AppColors.black30,
                  unCheckedBgColor: Colors.transparent,
                  onChanged: (val) {
                    store.updateClimb(updateBelayingStyle(climb, val));
                    autoNext();
                  },
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }

  Climb updateBelayingStyle(Climb climb, BelayingStyleEnum belayingStyle) {
    return climb.rebuild((c) => c..belayingStyle = belayingStyle);
  }
}
