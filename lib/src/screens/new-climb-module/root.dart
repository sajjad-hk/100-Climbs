import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/services/climbService.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';
import 'package:hundred_climbs/src/screens/screens.dart';

class NewClimb extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);
  final Duration _duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final appUser = Provider.of<AppUser>(context);
    final store = Provider.of<Store>(context);
    return Material(
      color: Color(0xffb3000000),
      shadowColor: Colors.white,
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10),
        duration: Duration(microseconds: 500),
        color: AppColors.getGradeColor(store.climb.grade),
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
              onTap: () => store.closeNewClimb(),
            ),
            Visibility(
              visible: store.currentPageIndex != 0,
              child: PageActionButton(
                alignment: Alignment.bottomLeft,
                iconData: Icons.arrow_back,
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
                      margin: const EdgeInsets.only(bottom: 30),
                      child: FlatButton.icon(
                        onPressed: () => saveAndLogAnother(context, appUser),
                        icon: Icon(
                          Icons.add,
                          color: AppColors.black30,
                        ),
                        label: Text(
                          'SAVE AND LOG ANOTHER',
                          style: TextStyle(
                            color: AppColors.black30,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    FlatButton.icon(
                      onPressed: () => saveAndClose(context, appUser),
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      label: Text(
                        'SAVE',
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
                alignment: Alignment.bottomRight,
                onTap: nextPage,
              ),
            )
          ],
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
