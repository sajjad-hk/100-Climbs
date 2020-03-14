import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: AppColors.silver,
          body: user?.totalNumOfClimbs != 0
              ? DashboardContent()
              : NoDataDashboardContent(
                  openDrawer: (context) => Scaffold.of(context).openDrawer,
                ),
          floatingActionButton: NewClimbFloatingActionButton(),
          drawer: Drawer(
            child: DrawerContent(),
          ),
          bottomNavigationBar: BottomActionBar(),
        );
      },
    );
  }
}
