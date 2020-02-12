import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/services/tagService.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class Tags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final user = Provider.of<AppUser>(context);
    final climb = store.climb;
    final isTagLimitReached = store.climb.tags.length >= 5;
    return Column(
      children: <Widget>[
        WizardPageTitle(
          title: "Tags",
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Text(
            "${climb.tags == null ? 0 : climb.tags.length.toString()}/5",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black12,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: isTagLimitReached,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    '5 tags limit reached',
                    style: TextStyle(
                      color: AppColors.black30,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    if (climb.tags != null)
                      for (String tag in climb.tags)
                        TagItem(
                          text: tag,
                          onTab: (tag) => store.updateClimb(
                            store.climb.rebuild(
                              (c) => c..tags.remove(tag),
                            ),
                          ),
                        )
                  ],
                ),
              ),
              Visibility(
                visible: !isTagLimitReached,
                child: FloatingActionButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FutureBuilder(
                        future: tagService.tags(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            List<String> ts = [
                              ...snapshot.data[0].toList()[0],
                              if (snapshot.data[1].toList().isNotEmpty)
                                ...snapshot.data[1].toList()[0]
                            ];
                            return TagsEditor(
                              userTagsHistory: ts.toList() ?? [],
                            );
                          } else
                            return Container();
                        },
                      ),
                    ),
                  ),
                  backgroundColor: Colors.black26,
                  elevation: 0,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }
}
