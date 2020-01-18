import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class ClimbTileContent extends StatelessWidget {
  final ViewClimb climb;

  ClimbTileContent(this.climb);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.getClimbingRouteOutcomeColor(climb.climb.outCome),
      child: InkWell(
        onLongPress: () => longPress(context, climb),
        onTap: () => tap(context, climb),
        child: ClimbTileContentWithRibbon(
          climb: climb,
        ),
      ),
    );
  }

  void tap(BuildContext context, ViewClimb viewClimb) {
    final store = Provider.of<Store>(context);
    store.selectClimb(viewClimb.climb);
    if (viewClimb.isSelected) {
      store.unSelectClimb(viewClimb.climb);
    } else {
      store.selectClimb(viewClimb.climb);
      Navigator.pushNamed(context, '/edit-climb-screen');
    }
  }

  void longPress(BuildContext context, ViewClimb viewClimb) {
    final store = Provider.of<Store>(context);
    store.selectMultiClimb(viewClimb.climb);
  }
}
