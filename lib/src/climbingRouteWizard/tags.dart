import 'package:climbing_logbook/src/climbingRouteWizard/pageTitle.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/state/wizardState.dart';
import 'package:climbing_logbook/src/climbingRouteWizard/tagItem.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Tags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<WizardState>(context);
    final ds = Provider.of<DashboardState>(context);

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
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0 &&
                    state.selectedTags.length < 5,
                child: FlatButton(
                  highlightColor: Colors.transparent,
                  onPressed: () => ds.openTagsEdit(),
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
            ],
          ),
        ),
      ],
    );
  }
}
