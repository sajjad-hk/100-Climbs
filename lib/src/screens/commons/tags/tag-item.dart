import 'package:hundred_climbs/src/screens/screens.dart';

class TagItem extends StatelessWidget {
  final String text;
  final Function onTab;
  TagItem({@required this.text, @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTab(text),
      child: Container(
        padding: const EdgeInsets.all(5.0),
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
                    fontSize: 16,
                  ),
                ),
              ),
              Icon(
                Icons.close,
                color: Colors.white,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
