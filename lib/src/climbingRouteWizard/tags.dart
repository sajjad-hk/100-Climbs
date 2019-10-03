import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/tagItem.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/tagsHistory.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Tags extends StatefulWidget {
  @override
  _TagsState createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  static TextEditingController _tagTextController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> stringTags;

  @override
  void initState() {
    super.initState();
  }

  filterTagsList(user) {
    List<String> filter = List<String>();
    filter.add(_tagTextController.text.toString());
    filter.addAll(user.tags.toList());
    filter = filter
        .where((it) => it.startsWith(_tagTextController.text.toString()))
        .take(3)
        .toList();
    if (mounted) {
      setState(() => stringTags = filter.toSet().toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WizardState>(context);
    final user = Provider.of<AppUser>(context);

    _tagTextController.addListener(() => filterTagsList(user));
    _tagTextController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: _tagTextController.text.length,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: WizardPageTitle(
            title: "Tags",
          ),
        ),
        Text(
          "${state.selectedTags.length.toString()}/5",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 2.0),
                blurRadius: 3.0,
                color: Color(0xff29000000),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 5,
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MediaQuery.of(context).viewInsets.bottom == 0.0
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 150),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    for (String tag in state.selectedTags)
                      TagItem(
                        text: tag,
                        onTab: (t) => state.removeTag(t),
                      )
                  ],
                ),
              ),
              Visibility(
                visible: state.selectedTags.length < 5,
                child: Container(
                  child: TextField(
                    focusNode: _focusNode,
                    textCapitalization: TextCapitalization.words,
                    textAlign: TextAlign.center,
                    controller: _tagTextController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Click to add...',
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4c000000),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff4c000000),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0 &&
                    state.selectedTags.length < 5,
                child: FlatButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff4c000000),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: _tagTextController.text != '',
                child: TagsHistory(
                  tags: stringTags,
                  onAdd: (tag) {
                    _tagTextController.text = '';
                    FocusScope.of(context).requestFocus(new FocusNode());
                    state.addTag(tag);
                    print(tag);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
