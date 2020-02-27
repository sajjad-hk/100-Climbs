import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class TagItem extends StatelessWidget {
  final String text;
  final Function onTab;
  TagItem({@required this.text, @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTab(text),
        child: Container(
          padding:
              const EdgeInsets.only(top: 2.0, bottom: 2.0, left: 8, right: 8),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                          [LayoutUtils(context).screenSize],
                    ),
                  ),
                ),
                Icon(
                  Icons.close,
                  color: Colors.white,
                  size: screens['TAG_ICON'][LayoutUtils(context).screenSize],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
