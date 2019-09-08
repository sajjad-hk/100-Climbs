//import 'package:climbing_logbook/src/colors/LogBookColors.dart';
//import 'package:climbing_logbook/src/customIcon.dart';
//import 'package:climbing_logbook/src/customRadio.dart';
//import 'package:climbing_logbook/src/models/enums.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:intl/intl.dart';
//import 'package:provider/provider.dart';
//
//import 'icons/LogBookIcons.dart';
//
//class EditRoute extends StatefulWidget {
//  @override
//  _EditRouteState createState() => _EditRouteState();
//}
//
//class _EditRouteState extends State<EditRoute> {
//  DateTime d;
//
//  Future _selectDate() async {
//    DateTime picked = await showDatePicker(
//      context: context,
//      initialDate: new DateTime.now(),
//      firstDate: DateTime(2015),
//      lastDate: DateTime(2030),
//      builder: (BuildContext context, Widget child) {
//        return Theme(
//          data: ThemeData.dark(),
//          child: child,
//        );
//      },
//    );
//    setState(() {
//      d = picked;
//    });
//    return picked;
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    d = DateTime.now();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    ScrollController scrollController = new ScrollController();
////    final climbingRoteState = Provider.of<ClimbingRouteState>(context);
//
//    return Container(
//      child: ListView.builder(
//        itemCount: 1,
//        itemBuilder: (context, index) {
//          return Column(
//            children: <Widget>[
//              Row(
//                children: <Widget>[
//                  Container(
//                    padding: const EdgeInsets.only(
//                      left: 20.0,
//                      bottom: 5.0,
//                    ),
//                    child: Text(
//                      'Date',
//                      style: TextStyle(
//                        fontSize: 18,
//                        color: Colors.white,
//                        shadows: <Shadow>[
//                          Shadow(
//                            offset: Offset(1.0, 2.0),
//                            blurRadius: 3.0,
//                            color: Color(0xff29000000),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  FlatButton(
//                    child: Container(
//                      height: 45,
////                      padding: const EdgeInsets.all(10.0),
//                      decoration: BoxDecoration(
//                        color: LogBookColors.black_30,
//                        borderRadius: BorderRadius.all(
//                          Radius.circular(4),
//                        ),
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        children: <Widget>[
//                          CustomIcon(
//                            color: Colors.white,
//                            path: LogBookIcons.calendar,
//                          ),
//                          Text(
//                            DateFormat.yMMMd().format(d).toString(),
//                            style: TextStyle(color: Colors.white),
//                            textAlign: TextAlign.center,
//                          ),
//                          Icon(
//                            Icons.keyboard_arrow_down,
//                            color: Colors.white,
//                          )
//                        ],
//                      ),
//                    ),
//                    color: Colors.transparent,
//                    onPressed: _selectDate,
//                  )
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    padding: const EdgeInsets.only(
//                        top: 10.0, left: 20.0, bottom: 5.0),
//                    child: Text(
//                      'Succeded?',
//                      style: TextStyle(
//                        fontSize: 18,
//                        color: Colors.white,
//                        shadows: <Shadow>[
//                          Shadow(
//                            offset: Offset(1.0, 2.0),
//                            blurRadius: 3.0,
//                            color: Color(0xff29000000),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: Container(
//                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                      child: AspectRatio(
//                        aspectRatio: 1.3,
//                        child: NewCustomRadio.col(
//                          value: OutComeEnum.valueOf('success'),
//                          groupValue: climbingRoteState.route.outCome,
//                          label: 'Yes',
//                          iconProvider: LogBookIcons.smile,
//                          checkedContentColor: Colors.white,
//                          checkedBgColor: Color(0xff4d000000),
//                          unCheckedBgColor: Colors.transparent,
//                          onChanged: (val) {
//                            climbingRoteState.outCome = val.toString();
//                          },
//                        ),
//                      ),
//                    ),
//                  ),
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: Container(
//                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                      child: AspectRatio(
//                        aspectRatio: 1.3,
//                        child: NewCustomRadio.col(
//                          value: OutComeEnum.valueOf('failure'),
//                          groupValue: climbingRoteState.route.outCome,
//                          label: 'No',
//                          iconProvider: LogBookIcons.sad,
//                          checkedContentColor: Colors.white,
//                          checkedBgColor: Color(0xff4d000000),
//                          unCheckedBgColor: Colors.transparent,
//                          onChanged: (val) {
//                            climbingRoteState.outCome = val.toString();
//                          },
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    padding: const EdgeInsets.only(
//                      top: 10.0,
//                      left: 20.0,
//                      bottom: 5.0,
//                    ),
//                    child: Text(
//                      'Scale and grade',
//                      style: TextStyle(
//                        fontSize: 18,
//                        color: Colors.white,
//                        shadows: <Shadow>[
//                          Shadow(
//                            offset: Offset(1.0, 2.0),
//                            blurRadius: 3.0,
//                            color: Color(0xff29000000),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: AspectRatio(
//                      aspectRatio: 2.6,
//                      child: Container(
//                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                        child: NewCustomRadio.row(
//                          value: GradingStyleEnum.valueOf('french'),
//                          groupValue: climbingRoteState.route.gradingStyle,
//                          label: 'French',
//                          checkedContentColor: Colors.white,
//                          checkedBgColor: Color(0xff4d000000),
//                          unCheckedBgColor: Colors.transparent,
//                          onChanged: (val) {
//                            climbingRoteState.gradingStyle = val.toString();
//                            climbingRoteState.grade =
//                                climbingRoteState.climbingGradeValues[0];
//                          },
//                        ),
//                      ),
//                    ),
//                  ),
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: AspectRatio(
//                      aspectRatio: 2.6,
//                      child: Container(
//                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                        child: NewCustomRadio.row(
//                          value: GradingStyleEnum.valueOf('polish'),
//                          groupValue: climbingRoteState.route.gradingStyle,
//                          label: 'Polish',
//                          checkedContentColor: Colors.white,
//                          checkedBgColor: Color(0xff4d000000),
//                          unCheckedBgColor: Colors.transparent,
//                          onChanged: (val) {
//                            climbingRoteState.gradingStyle = val.toString();
//                            climbingRoteState.grade =
//                                climbingRoteState.climbingGradeValues[0];
//                          },
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Container(
//                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
//                height: 70,
//                child: ListView.builder(
//                  controller: scrollController,
//                  itemBuilder: (context, index) {
//                    if (climbingRoteState.climbingGradeValues[index] ==
//                            climbingRoteState.route.grade &&
//                        index > 2) {
//                      scrollController.animateTo((index - 2) * 83.0,
//                          duration: Duration(milliseconds: 200),
//                          curve: Curves.easeIn);
//                    }
//
//                    return Container(
//                      key: Key(index.toString()),
//                      child: NewCustomRadio.row(
//                        value: climbingRoteState.climbingGradeValues[index],
//                        groupValue: climbingRoteState.route.grade,
//                        checkedBgColor: Color(0xff4d000000),
//                        unCheckedBgColor: Colors.transparent,
//                        checkedContentColor: Colors.white,
//                        label: climbingRoteState.climbingGradeValues[index],
//                        onChanged: (val) {
//                          climbingRoteState.grade = val.toString();
//                        },
//                      ),
//                      margin: EdgeInsets.all(5),
//                      height: 60,
//                      width: 70,
//                    );
//                  },
//                  itemCount: climbingRoteState.climbingGradeValues.length,
//                  scrollDirection: Axis.horizontal,
//                ),
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    padding: const EdgeInsets.only(
//                      top: 10.0,
//                      left: 20.0,
//                      bottom: 5.0,
//                    ),
//                    child: Text(
//                      'Belay',
//                      style: TextStyle(
//                        fontSize: 18,
//                        color: Colors.white,
//                        shadows: <Shadow>[
//                          Shadow(
//                            offset: Offset(1.0, 2.0),
//                            blurRadius: 3.0,
//                            color: Color(0xff29000000),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: Container(
//                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                      width: 100,
//                      height: 100,
//                      child: NewCustomRadio.col(
//                        value: BelayingStyleEnum.valueOf('lead'),
//                        groupValue: climbingRoteState.route.belayingStyle,
//                        label: 'Lead',
//                        iconProvider: LogBookIcons.lead,
//                        checkedContentColor: Colors.white,
//                        checkedBgColor: Color(0xff4d000000),
//                        unCheckedBgColor: Colors.transparent,
//                        onChanged: (val) {
//                          climbingRoteState.belayingStyle = val.toString();
//                        },
//                      ),
//                    ),
//                  ),
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: Container(
//                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                      width: 100,
//                      height: 100,
//                      child: NewCustomRadio.col(
//                        value: BelayingStyleEnum.valueOf('auto'),
//                        groupValue: climbingRoteState.route.belayingStyle,
//                        label: 'Auto',
//                        iconProvider: LogBookIcons.auto,
//                        checkedContentColor: Colors.white,
//                        checkedBgColor: Color(0xff4d000000),
//                        unCheckedBgColor: Colors.transparent,
//                        onChanged: (val) {
//                          climbingRoteState.belayingStyle = val.toString();
//                        },
//                      ),
//                    ),
//                  ),
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: Container(
//                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                      width: 100,
//                      height: 100,
//                      child: NewCustomRadio.col(
//                        value: BelayingStyleEnum.valueOf('toprope'),
//                        groupValue: climbingRoteState.route.belayingStyle,
//                        label: 'Toprope',
//                        iconProvider: LogBookIcons.toprope,
//                        checkedContentColor: Colors.white,
//                        checkedBgColor: Color(0xff4d000000),
//                        unCheckedBgColor: Colors.transparent,
//                        onChanged: (val) {
//                          climbingRoteState.belayingStyle = val.toString();
//                        },
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  Container(
//                    padding: const EdgeInsets.only(
//                      top: 10.0,
//                      left: 20.0,
//                      bottom: 5.0,
//                    ),
//                    child: Text(
//                      'Tags',
//                      style: TextStyle(
//                        fontSize: 18,
//                        color: Colors.white,
//                        shadows: <Shadow>[
//                          Shadow(
//                            offset: Offset(1.0, 2.0),
//                            blurRadius: 3.0,
//                            color: Color(0xff29000000),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: Container(
//                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                      width: 130,
//                      height: 50,
//                      child: NewCustomRadio.row(
//                        value: ClosureEnum.valueOf('flash'),
//                        groupValue: climbingRoteState.route.closure,
//                        label: 'FLASH',
//                        iconProvider: LogBookIcons.flash,
//                        checkedContentColor: Colors.white,
//                        checkedBgColor: Color(0xff4d000000),
//                        unCheckedBgColor: Colors.white,
//                        onChanged: (val) {
//                          climbingRoteState.closure = val.toString();
//                        },
//                      ),
//                    ),
//                  ),
//                  Flexible(
//                    fit: FlexFit.tight,
//                    child: Container(
//                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//                      width: 130,
//                      height: 50,
//                      child: NewCustomRadio.row(
//                        value: ClosureEnum.valueOf('onsight'),
//                        groupValue: climbingRoteState.route.closure,
//                        label: 'On Sight',
//                        iconProvider: LogBookIcons.eye,
//                        checkedContentColor: Colors.white,
//                        checkedBgColor: Color(0xff4d000000),
//                        unCheckedBgColor: Colors.white,
//                        onChanged: (val) {
//                          climbingRoteState.closure = val.toString();
//                        },
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          );
//        },
//      ),
//    );
//  }
//}
