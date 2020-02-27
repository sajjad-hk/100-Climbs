import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/screens/dashboard-screen/climb-tiles/climb-tile-wrapper.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/values.dart';

class ClimbingRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<DateTime, List<Climb>> groupedRoutes =
        Provider.of<Map<DateTime, List<Climb>>>(context);
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 60),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          flattenGroupedRoutes(
              groupedRoutes,
              context,
              screens['DASHBOARD']['FONT_SIZE']
                  [LayoutUtils(context).screenSize]),
        ),
      ),
    );
  }

  List<Widget> flattenGroupedRoutes(
      Map<DateTime, List<Climb>> groupedRoutes, context, fontSize) {
    if (getDateTimeKeys(groupedRoutes).isEmpty)
      return [
        Container(
          height: double.maxFinite,
        ),
      ];
    return getDateTimeKeys(groupedRoutes)
        .reversed
        .map((it) {
          return [
            createDate(it, fontSize),
            ...createClimbs(groupedRoutes[it], context)
          ];
        })
        .expand((i) => i)
        .toList();
  }

  List<DateTime> getDateTimeKeys(Map<DateTime, List<Climb>> groupedRoutes) {
    return groupedRoutes == null ? [] : groupedRoutes.keys.toList()
      ..sort();
  }

  Widget createDate(DateTime date, double fontSize) {
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 2),
      child: Row(
        children: <Widget>[
          CustomIcon(
            color: AppColors.warmGrey,
            path: AppIcons.calendar,
            size: 25,
          ),
          Text(
            DateFormat.yMMMMEEEEd().format(date),
            style: TextStyle(color: AppColors.warmGrey, fontSize: fontSize),
          ),
        ],
      ),
    );
  }

  List<Widget> createClimbs(List<Climb> routes, context) {
    final store = Provider.of<Store>(context);
    routes.sort((a, b) => a.loggedDate.compareTo(b.loggedDate));
    return routes.reversed
        .map((it) => ViewClimb(it, store.isClimbSelected(it)))
        .map(
          (it) => ClimbTileWrapper(it),
        )
        .toList();
  }
}

class ViewClimb {
  ViewClimb(this.climb, this.isSelected);

  Climb climb;
  bool isSelected;

  bool get isFailure => climb.outCome == OutComeEnum.failure;
}
