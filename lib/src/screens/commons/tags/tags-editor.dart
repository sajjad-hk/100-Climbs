import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class TagsEditor extends StatefulWidget {
  final List<String> userTagsHistory;

  const TagsEditor({Key key, @required this.userTagsHistory}) : super(key: key);

  @override
  State createState() => _State();
}

class _State extends State<TagsEditor> {
  final TextEditingController _tagTextController = TextEditingController();
  List<TagModel> tags;

  @override
  void initState() {
    _tagTextController.text = '';
    tags = List();
    super.initState();
  }

  @override
  build(BuildContext context) {
    final store = Provider.of<Store>(context);
    final climb = store.climb;
    _tagTextController.addListener(() => tagFilteringHandler(context));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edidting tags',
          ),
        ),
        backgroundColor: AppColors.getGradeColor(climb.grade),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30.0, left: 15),
              padding: const EdgeInsets.all(3.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.left,
                controller: _tagTextController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Click to add...',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black26,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black26,
                ),
              ),
            ),
            TagsHistory(
              tags: tags ?? [],
              onTagTap: (tag) {
                onTagTap(context, tag);
                tagFilteringHandler(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void tagFilteringHandler(BuildContext context) {
    final store = Provider.of<Store>(context);
    List<TagModel> tagModels = widget.userTagsHistory
        .where((i) =>
            i.startsWith(_tagTextController.text) &&
            _tagTextController.text.isNotEmpty)
        .take(10)
        .map((it) => TagModel(it, store.climb.tags.contains(it)))
        .toList();

    setState(() {
      tags = tagModels;
    });
  }

  void onTagTap(BuildContext context, TagModel tag) {
    final store = Provider.of<Store>(context);
    store.updateClimb(store.climb.rebuild((c) => c..tags.add(tag.value)));
    Navigator.pop(context);
  }
}

class TagModel {
  String value;
  bool isAlreadyAdded;

  TagModel(this.value, this.isAlreadyAdded);
}
