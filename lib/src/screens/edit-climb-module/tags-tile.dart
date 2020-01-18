import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class TagsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    final isTagLimitReached = store.climb.tags.length >= 5;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Visibility(
            visible: !isTagLimitReached,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: FloatingActionButton(
                heroTag: 'EDITE_TAGS',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TagsEditor(
                      userTagsHistory: user?.tags?.toList() ?? [],
                    ),
                  ),
                ),
                elevation: 0,
                mini: true,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black26,
              ),
            ),
          ),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: <Widget>[
              for (String tag in climb?.tags)
                TagItem(
                  text: tag,
                  onTab: (tag) => store.updateClimb(
                      store.climb.rebuild((c) => c..tags.remove(tag))),
                )
            ],
          )
        ],
      ),
    );
  }
}
