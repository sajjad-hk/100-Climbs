import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/tagsHistory.dart';
import 'package:climbing_logbook/src/commons/appBar.dart';
import 'package:climbing_logbook/src/dashboard/state/DashboardMode.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TagsL extends StatefulWidget {
  TagsL();
  @override
  State createState() => _State();
}

class _State extends State<TagsL> {
  final TextEditingController _tagTextController = TextEditingController();
  List<String> stringTags;

  @override
  void initState() {
    _tagTextController.text = '';
    stringTags = List();
    super.initState();
  }

  @override
  build(BuildContext context) {
    DashboardState ds = Provider.of<DashboardState>(context);
    WizardState ws = Provider.of<WizardState>(context);
    AppUser user = Provider.of<AppUser>(context);
    _tagTextController.addListener(() {
      setState(() {
        stringTags = user.tags
            .where(
              (i) => i.startsWith(_tagTextController.text),
            )
            .take(4)
            .toList();
      });
    });
    return SafeArea(
      child: Scaffold(
        appBar: PreferredAppBar.tag(),
        backgroundColor:
            AppColors.getGradeColor(ds.selectedClimbingRoute?.grade),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 120,
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.all(3.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                controller: _tagTextController,
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
              visible: _tagTextController.text != '',
              child: TagsHistory(
                tags: stringTags ?? [],
                onAdd: (tag) {
                  if (ds.previousMode ==
                      DashboardMode.editClimbingRoutePageOpen)
                    ds.pickClimbingRoute(ds.selectedClimbingRoute
                        .rebuild((r) => r..tags.add(tag)));
                  else
                    ws.addTag(tag);
                  ds.closeTagEdit();
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
