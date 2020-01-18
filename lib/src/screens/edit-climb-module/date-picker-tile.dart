import 'package:hundred_climbs/src/screens/screens.dart';

class DatePickerTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        DatePickerButton(),
      ],
    );
  }
}
