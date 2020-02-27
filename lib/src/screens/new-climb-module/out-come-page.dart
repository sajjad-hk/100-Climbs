import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class OutCome extends StatelessWidget {
  final GestureTapCallback autoNext;

  OutCome({this.autoNext});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.loose,
          child: WizardPageTitle(
            title: 'Succeded?',
          ),
        ),
        Flexible(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: screens['PAGE_OUT_COME']['BUTTON_WIDTH']
                    [LayoutUtils(context).screenSize],
                height: screens['PAGE_OUT_COME']['BUTTON_HEIGHT']
                    [LayoutUtils(context).screenSize],
                padding: const EdgeInsets.all(10),
                child: NewCustomRadio.col(
                  value: OutComeEnum.valueOf('success'),
                  groupValue: climb.outCome,
                  label: 'Yup',
                  fontSize: screens['NEW_CLIMB']['BUTTON_FONT']
                      [LayoutUtils(context).screenSize],
                  iconProvider: AppIcons.smile,
                  iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                      [LayoutUtils(context).screenSize],
                  checkedContentColor: Colors.white,
                  checkedBgColor: AppColors.black30,
                  unCheckedBgColor: Colors.transparent,
                  onChanged: (val) {
                    store.updateClimb(updateOutCOme(climb, val));
                    autoNext();
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screens['PAGE_OUT_COME']['BUTTON_WIDTH']
                    [LayoutUtils(context).screenSize],
                height: screens['PAGE_OUT_COME']['BUTTON_HEIGHT']
                    [LayoutUtils(context).screenSize],
                padding: const EdgeInsets.all(10),
                child: NewCustomRadio.col(
                  value: OutComeEnum.valueOf('failure'),
                  groupValue: climb.outCome,
                  label: 'Tried but failed',
                  fontSize: screens['NEW_CLIMB']['BUTTON_FONT']
                      [LayoutUtils(context).screenSize],
                  iconProvider: AppIcons.sad,
                  iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                      [LayoutUtils(context).screenSize],
                  checkedContentColor: Colors.white,
                  checkedBgColor: AppColors.black30,
                  unCheckedBgColor: Colors.transparent,
                  onChanged: (val) {
                    store.updateClimb(updateOutCOme(climb, val));
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

  Climb updateOutCOme(Climb climb, OutComeEnum outCome) {
    return climb.rebuild((c) => c..outCome = outCome);
  }
}
