import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/climbService.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class NewClimb extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);
  final Duration _duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);
    final store = Provider.of<Store>(context);
    return Material(
      color: AppColors.black70,
      shadowColor: Colors.white,
      child: AnimatedContainer(
        margin: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 10),
        duration: Duration(microseconds: 500),
        color: AppColors.getGradeColor(store.climb.grade),
        child: Container(
          child: Stack(
            children: <Widget>[
              PageView(
                controller: _controller,
                onPageChanged: (i) => store.currentPageIndex = i,
                children: <Widget>[
                  OutCome(
                    autoNext: nextPage,
                  ),
                  Grade(),
                  BelayStyle(
                    autoNext: nextPage,
                  ),
                  Tags(),
                ],
              ),
              PageActionButton(
                alignment: Alignment.topRight,
                iconData: Icons.close,
                iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                    [LayoutUtils(context).screenSize],
                onTap: () => store.closeNewClimb(),
              ),
              Visibility(
                visible: store.currentPageIndex != 0,
                child: PageActionButton(
                  alignment: Alignment.bottomLeft,
                  iconData: Icons.arrow_back,
                  iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                      [LayoutUtils(context).screenSize],
                  onTap: previousPage,
                ),
              ),
              Visibility(
                visible: store.currentPageIndex >= 2,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
//                        margin: const EdgeInsets.only(bottom: 30),
                        child: FlatButton.icon(
                          onPressed: () => saveAndLogAnother(context, appUser),
                          icon: Icon(
                            Icons.add,
                            size: screens['NEW_CLIMB']['PAGE_ICON']
                                [LayoutUtils(context).screenSize],
                            color: AppColors.black30,
                          ),
                          label: Text(
                            'SAVE AND LOG ANOTHER',
                            style: TextStyle(
                              color: AppColors.black30,
                              fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                                  [LayoutUtils(context).screenSize],
                            ),
                          ),
                        ),
                      ),
                      FlatButton.icon(
                        onPressed: () => saveAndClose(context, appUser),
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: screens['NEW_CLIMB']['PAGE_ICON']
                              [LayoutUtils(context).screenSize],
                        ),
                        label: Text(
                          'SAVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                                [LayoutUtils(context).screenSize],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: store.currentPageIndex != 3,
                child: PageActionButton(
                  iconData: Icons.arrow_forward,
                  iconSize: screens['NEW_CLIMB']['PAGE_ACTION_BUTTON']
                      [LayoutUtils(context).screenSize],
                  alignment: Alignment.bottomRight,
                  onTap: nextPage,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveAndClose(BuildContext context, AppUser user) {
    final store = Provider.of<Store>(context);
    climbService.addClimb(store.climb);
    _controller.jumpToPage(0);
    store.closeNewClimb();
  }

  void saveAndLogAnother(BuildContext context, AppUser user) {
    final store = Provider.of<Store>(context);
    climbService.addClimb(store.climb);
    _controller.jumpToPage(0);
  }

  void nextPage() {
    _controller.nextPage(duration: _duration, curve: Curves.bounceOut);
  }

  void previousPage() {
    _controller.previousPage(duration: _duration, curve: Curves.bounceIn);
  }
}
