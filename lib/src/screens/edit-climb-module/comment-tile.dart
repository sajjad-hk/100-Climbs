import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class CommentTile extends StatelessWidget {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    _controller.text = store.climb?.comment;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black30,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 3,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(4.0),
          fillColor: AppColors.black30,
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: screens['NEW_CLIMB']['BUTTON_FONT']
              [LayoutUtils(context).screenSize],
        ),
        onSubmitted: (value) {
          store.updateClimb(
              store.climb.rebuild((r) => r..comment = _controller.text));
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        controller: _controller,
      ),
    );
  }
}
