import 'package:hundred_climbs/src/screens/screens.dart';

class NoDataDashboardContent extends StatelessWidget {
  final Function(BuildContext) openDrawer;

  NoDataDashboardContent({@required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      backgroundColor: AppColors.silver,
      elevation: 0,
      leading: IconButton(
        onPressed: openDrawer(context),
        icon: Icon(
          Icons.menu,
          color: AppColors.black30,
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: AppColors.silver,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                strutStyle: StrutStyle(
                  height: 1.5,
                ),
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      semanticsLabel: 'No data',
                      text: 'No data \n',
                      style: TextStyle(
                        color: AppColors.black30,
                        fontSize: 26,
                      ),
                    ),
                    TextSpan(
                      semanticsLabel: 'Go do some climbing!',
                      text: 'Go do some climbing!',
                      style: TextStyle(
                        color: AppColors.black30,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.2, // todo fix it wrong number
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppIcons.emptyIllustration),
                  ),
                ),
              ),
            ),
            Container(
              child: RichText(
                textAlign: TextAlign.center,
                strutStyle: StrutStyle(
                  height: 1.5,
                ),
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      semanticsLabel: 'Click + to record',
                      text: 'Click \'+\' to record\n',
                      style: TextStyle(
                        color: AppColors.black30,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      semanticsLabel: 'your first climb',
                      text: 'your first climb',
                      style: TextStyle(
                        color: AppColors.black30,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: appBar.preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}
