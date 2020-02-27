import 'package:hundred_climbs/src/screens/screens.dart';

class PageActionButton extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback onTap;
  final AlignmentGeometry alignment;
  final double iconSize;

  const PageActionButton(
      {Key key, this.iconData, this.onTap, this.alignment, this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: const EdgeInsets.all(5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white12,
          borderRadius: BorderRadius.circular(35.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              iconData,
              color: Colors.white,
              size: iconSize ?? 40,
            ),
          ),
        ),
      ),
    );
  }
}
