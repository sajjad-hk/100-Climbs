import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DatePickerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    DateTime date = store.climb?.loggedDate ?? DateTime.now();
    return InkWell(
      child: Container(
        height: screens['EDIT_CLIMB']['BUTTON_HEIGHT']
            [LayoutUtils(context).screenSize],
        decoration: BoxDecoration(
          color: AppColors.black30,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: CustomIcon(
                color: Colors.white,
                path: AppIcons.calendar,
                size: screens['EDIT_CLIMB']['ICON_SIZE']
                    [LayoutUtils(context).screenSize],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                DateFormat.yMEd().format(date).toString(),
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      onTap: () => pickDate(context),
    );
  }

  pickDate(BuildContext context) async {
    final store = Provider.of<Store>(context);
    final DateTime currentDate = store.climb.loggedDate;
    DateTime pickedDate = await showDatePicker(
          context: context,
          initialDate: store.climb.loggedDate,
          firstDate: DateTime(2015),
          lastDate: DateTime.now().add(Duration(days: 1)),
          builder: (BuildContext context, Widget child) {
            return child;
          },
        ) ??
        currentDate;
    store.updateClimb(
        store.climb.rebuild((climb) => climb..loggedDate = pickedDate));
    return pickedDate;
  }
}
