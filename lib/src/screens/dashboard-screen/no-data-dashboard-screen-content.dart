import 'package:hundred_climbs/src/screens/screens.dart';

class NoDataDashboardContent extends StatelessWidget {
  final Function(BuildContext) openDrawer;

  NoDataDashboardContent({@required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.silver,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: openDrawer(context),
                icon: Icon(
                  Icons.menu,
                  color: AppColors.black30,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'No data',
                style: TextStyle(
                  color: AppColors.black30,
                  fontSize: 26,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Go do some climbing!',
                style: TextStyle(
                  color: AppColors.black30,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/empty_illustration.png'),
              ),
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Click here to',
                style: TextStyle(
                  color: AppColors.black30,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'record your first climb',
                style: TextStyle(
                  color: AppColors.black30,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/icons/empty_arrow.png'),
                  fit: BoxFit.fitHeight),
            ),
          ),
        ],
      ),
    );
  }
}
