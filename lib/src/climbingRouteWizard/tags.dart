import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/tagItem.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/tagsHistory.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Tags extends StatelessWidget {
  static TextEditingController _tagTextController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  filterTagsList() {
    print(_tagTextController.text);
//    climbingRoteState.userTags = climbingRoteState.usersTags
//                        .where((String f) => f.startsWith(value) && value != '')
//                        .toList();
  }

  Tags() {
    _tagTextController.addListener(() => filterTagsList());
    _tagTextController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: _tagTextController.text.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
    final user = Provider.of<ClimbingLogBookUser>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: WizardPageTitle(
            title: 'Tags',
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 2,
          children: [
            for (String tag in climbingRoteState.route.tags)
              TagItem(
                text: tag,
              )
          ],
        ),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
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
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: FlatButton(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
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
              TagsHistory(),
            ],
          ),
        ),
      ],
    );
  }
}
