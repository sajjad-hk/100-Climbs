import 'package:firebase_auth/firebase_auth.dart';
import 'package:hundred_climbs/src/screens/layout-utils/layout-utils.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/auth.dart';
import 'package:hundred_climbs/src/services/climbService.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class EditRouteWizard extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EditRouteWizard> {
  ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(Widget oldWidget) {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final firebaseUser = Provider.of<FirebaseUser>(context);

    return StreamProvider.value(
      value: authService.userInfo(firebaseUser?.uid),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Editing climb',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Container(
            color: AppColors.getGradeColor(store.climb?.grade),
            child: ListView(
              controller: _scrollController,
              children: <Widget>[
                TileSection(
                  title: 'Date',
                  withMargin: true,
                  content: DatePickerTile(),
                ),
                TileSection(
                  title: 'Succeded?',
                  withMargin: true,
                  content: OutComeTile(),
                ),
                TileSection(
                  title: 'Grade',
                  withMargin: false,
                  content: HorizontalGradePicker(),
                ),
                TileSection(
                  title: 'Belay',
                  withMargin: true,
                  content: BelayStyleTile(),
                ),
                TileSection(
                  title: 'Tags',
                  withMargin: true,
                  content: TagsTile(),
                ),
                TileSection(
                  title: 'Comments',
                  withMargin: true,
                  content: CommentTile(),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                padding: const EdgeInsets.all(5.0),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: screens['EDIT_CLIMB']['ICON_SIZE']
                      [LayoutUtils(context).screenSize],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                onPressed: () {
                  climbService.deleteClimb(store.climb.documentId);
                  Navigator.pop(context);
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: screens['EDIT_CLIMB']['ACTION_ICON']
                            [LayoutUtils(context).screenSize],
                      ),
                    ),
                    Text(
                      'DELETE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screens['NEW_CLIMB']['PAGE_ACTION_FONT']
                              [LayoutUtils(context).screenSize]),
                    ),
                  ],
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(5.0),
                icon: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: screens['EDIT_CLIMB']['ICON_SIZE']
                      [LayoutUtils(context).screenSize],
                ),
                onPressed: () {
                  climbService.updateClimb(store.climb);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
