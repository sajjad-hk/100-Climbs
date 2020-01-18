import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
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
      children: <Widget>[
        WizardPageTitle(
          title: 'Belay',
        ),
        Container(
          width: 170,
          height: 80,
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.only(bottom: 10, top: 30),
          child: NewCustomRadio.row(
            label: 'Lead',
            fontSize: 18,
            value: BelayingStyleEnum.valueOf('lead'),
            groupValue: climb.belayingStyle,
            iconSize: 50,
            iconProvider: AppIcons.lead,
            checkedContentColor: Colors.white,
            checkedBgColor: Color(0xff4d000000),
            unCheckedBgColor: Colors.transparent,
            onChanged: (val) {
              store.updateClimb(updateBelayingStyle(climb, val));
              autoNext();
            },
          ),
        ),
        Container(
          width: 170,
          height: 80,
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: NewCustomRadio.row(
            label: 'Auto',
            fontSize: 18,
            value: BelayingStyleEnum.valueOf('auto'),
            groupValue: climb.belayingStyle,
            iconSize: 50,
            iconProvider: AppIcons.auto,
            checkedContentColor: Colors.white,
            checkedBgColor: Color(0xff4d000000),
            unCheckedBgColor: Colors.transparent,
            onChanged: (val) {
              store.updateClimb(updateBelayingStyle(climb, val));
              autoNext();
            },
          ),
        ),
        Container(
          width: 170,
          height: 80,
          padding: const EdgeInsets.only(bottom: 10),
          margin: const EdgeInsets.only(bottom: 10),
          child: NewCustomRadio.row(
            label: 'Toprope',
            fontSize: 18,
            value: BelayingStyleEnum.valueOf('toprope'),
            groupValue: climb.belayingStyle,
            iconSize: 50,
            iconProvider: AppIcons.topRope,
            checkedContentColor: Colors.white,
            checkedBgColor: Color(0xff4d000000),
            unCheckedBgColor: Colors.transparent,
            onChanged: (val) {
              store.updateClimb(updateBelayingStyle(climb, val));
              autoNext();
            },
          ),
        ),
      ],
    );
  }

  Climb updateBelayingStyle(Climb climb, BelayingStyleEnum belayingStyle) {
    return climb.rebuild((c) => c..belayingStyle = belayingStyle);
  }
}
