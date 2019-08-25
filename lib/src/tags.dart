import 'package:climbing_logbook/src/customRadio.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Tags extends StatelessWidget {
  static TextEditingController tagTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
    final user = Provider.of<ClimbingLogBookUser>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: Flexible(
            flex:2,
            fit: FlexFit.loose,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Tags',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 2.0),
                            blurRadius: 3.0,
                            color: Color(0xff29000000),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                      ),
                      child: Text(
                        'Style',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 2.0),
                              blurRadius: 3.0,
                              color: Color(0xff29000000),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(left: 2.0, right: 7.5),
                            child: NewCustomRadio.row(
                              value: ClosureEnum.valueOf('onsight'),
                              groupValue: climbingRoteState.route.closure,
                              label: 'On Sight',
                              fontSize: 18,
                              iconProvider: LogBookIcons.eye,
                              checkedContentColor: Colors.white,
                              checkedBgColor: Color(0xff4d000000),
                              unCheckedBgColor: Colors.white,
                              onChanged: (val) {
                                climbingRoteState.closure = val.toString();
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.only(
                              right: 2.0,
                              left: 7.5,
                            ),
                            child: NewCustomRadio.row(
                              value: ClosureEnum.valueOf('flash'),
                              groupValue: climbingRoteState.route.closure,
                              label: 'FLASH',
                              fontSize: 18,
                              iconProvider: LogBookIcons.flash,
                              checkedContentColor: Colors.white,
                              checkedBgColor: Color(0xff4d000000),
                              unCheckedBgColor: Colors.white,
                              onChanged: (val) {
                                climbingRoteState.closure = val.toString();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
//        Visibility(
//          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
//          child: Flexible(
//            flex: 1,
//            child:
//          ),
//        ),
//        Visibility(
//          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
//          child: Flexible(
//            flex: 1,
//            fit: FlexFit.tight,
//            child:
//          ),
//        ),
        Flexible(
          flex: 3,
          fit: FlexFit.loose,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        bottom: 5.0,
                      ),
                      child: Text(
                        'Other',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 2.0),
                              blurRadius: 3.0,
                              color: Color(0xff29000000),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: 5,
                children: [
                  for (String tag in climbingRoteState.route.tags)
                    FlatButton(
                      onPressed: () {
                        List tags = climbingRoteState.route.tags.toList();
                        tags.remove(tag);
                        climbingRoteState.tags = tags;
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xff4c000000),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        width: tag.length * 9.0 + 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                        child: Container(
                          child: TextField(
                            textCapitalization: TextCapitalization.words,
                            textAlign: TextAlign.left,
                            controller: tagTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Click to add ...',
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
                            onChanged: (String value) {
                              print(value);
                              climbingRoteState.userTags = climbingRoteState.usersTags.where((String f) => f.startsWith(value) && value != '').toList();
                              print(climbingRoteState.usersTags.toString());
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: 250,
                child: ListView.builder(
                  itemCount: climbingRoteState.usersTags.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        climbingRoteState.tag = climbingRoteState.usersTags.toList()[index];
                      },
                      child: Container(
                        margin: const EdgeInsets.all(0.5),
                        padding: const EdgeInsets.all(2.5),
                        color: Color(0xff4c000000),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                climbingRoteState.usersTags[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                child: Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: InkWell(
                    onTap: () {
                      climbingRoteState.uid = user.uid;
                      climbingRouteService.addRoute(climbingRoteState.route);
                      // Save the route
                      // Go back to first tab
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          '+ LOG ANOTHER ROUTE',
                          style: TextStyle(
                            color: Color(0xff4c000000),
                            fontSize: 18,
                          ),
                        ),
                      ),
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
