import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class OutCome extends StatelessWidget {
  final GestureTapCallback autoNext;
  final double sizing;

  OutCome({this.autoNext, this.sizing});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    return Column(
      children: <Widget>[
        WizardPageTitle(
          title: 'Succeded?',
        ),
        Container(
          width: 160,
          height: 140,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 40),
          child: NewCustomRadio.col(
            value: OutComeEnum.valueOf('success'),
            groupValue: climb.outCome,
            label: 'Yup',
            fontSize: 18,
            iconProvider: AppIcons.smile,
            iconSize: 40,
            checkedContentColor: Colors.white,
            checkedBgColor: Color(0xff4d000000),
            unCheckedBgColor: Colors.transparent,
            onChanged: (val) {
              store.updateClimb(updateOutCOme(climb, val));
              autoNext();
            },
          ),
        ),
        Container(
          width: 160,
          height: 140,
          padding: const EdgeInsets.all(10),
          child: NewCustomRadio.col(
            value: OutComeEnum.valueOf('failure'),
            groupValue: climb.outCome,
            label: 'Tried but failed',
            fontSize: 18,
            iconProvider: AppIcons.sad,
            iconSize: 40,
            checkedContentColor: Colors.white,
            checkedBgColor: Color(0xff4d000000),
            unCheckedBgColor: Colors.transparent,
            onChanged: (val) {
              store.updateClimb(updateOutCOme(climb, val));
              autoNext();
            },
          ),
        ),
      ],
    );
  }

  Climb updateOutCOme(Climb climb, OutComeEnum outCome) {
    return climb.rebuild((c) => c..outCome = outCome);
  }
}
