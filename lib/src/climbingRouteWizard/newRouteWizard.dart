import 'package:hundred_climbs/src/climbingRouteWizard/belayStyle.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/climbingStyle.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/grade.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/outCome.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/state/wizardState.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/tags.dart';
import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/dashboard/state/dashboardState.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/services/climbingRouteService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/values.dart';

class NewRouteWizard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _routeWizardWrapper(context);
  }

  _routeWizardWrapper(BuildContext context) {
    final wizardState = Provider.of<WizardState>(context);
    final dashboardState = Provider.of<DashboardState>(context);
    final user = Provider.of<AppUser>(context);
    PageController _controller =
        PageController(initialPage: wizardState.currentPageIndex);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          child: AnimatedContainer(
            color: Color(0xffb3000000),
            padding: const EdgeInsets.all(12.0),
            duration: Duration(microseconds: 500),
            child: Card(
              color: AppColors.getGradeColor(wizardState.selectedClimbingGrade),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          iconSize: 50,
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.jumpToPage(0);
                            wizardState.currentPageIndex = 0;
                            dashboardState.closeNewRouteWizard();
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      child: PageView(
                        controller: _controller,
                        onPageChanged: (index) =>
                            wizardState.currentPageIndex = index,
                        children: <Widget>[
                          OutCome(
                            autoNext: () => _controller.nextPage(
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn,
                            ),
                          ),
                          Grade(),
                          BelayStyle(
                            autoNext: () => _controller.nextPage(
                              duration: Duration(
                                milliseconds: 500,
                              ),
                              curve: Curves.easeIn,
                            ),
                          ),
                          if (wizardState.selectedOutCome ==
                              OutComeEnum.success)
                            ClimbingStyle(
                              autoNext: () => _controller.nextPage(
                                duration: Duration(
                                  milliseconds: 500,
                                ),
                                curve: Curves.easeIn,
                              ),
                            ),
                          Tags(),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 20),
                        child: Visibility(
                          visible: wizardState.currentPageIndex >= 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  climbingRouteService
                                      .saveNewClimbingRouteAndNewTags(
                                          user, wizardState);
                                  _controller.jumpToPage(0);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Color(0xff4d000000),
                                      size: 35,
                                    ),
                                    Text(
                                      'SEVE AND LOG ANOTHER',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff4d000000),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              fit: FlexFit.tight,
                              child: Visibility(
                                visible: wizardState.currentPageIndex != 0,
                                child: IconButton(
                                  iconSize: 50,
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () => _controller.previousPage(
                                    duration: Duration(
                                      milliseconds: 200,
                                    ),
                                    curve: Curves.easeIn,
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: Visibility(
                                visible: wizardState.currentPageIndex >= 2,
                                child: InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    climbingRouteService
                                        .saveNewClimbingRouteAndNewTags(
                                            user, wizardState);
                                    wizardState.flush();
                                    _controller.jumpToPage(0);
                                    dashboardState.close();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      Text(
                                        'SAVE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          shadows: <Shadow>[
                                            Shadow(
                                              offset: Offset(1.0, 2.0),
                                              blurRadius: 3.0,
                                              color: Color(0xff29000000),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Visibility(
                                visible: (wizardState.selectedOutCome ==
                                            OutComeEnum.success &&
                                        wizardState.currentPageIndex != 4) ||
                                    (wizardState.selectedOutCome ==
                                            OutComeEnum.failure &&
                                        wizardState.currentPageIndex != 3),
                                child: IconButton(
                                  iconSize: 50,
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration: Duration(
                                        milliseconds: 200,
                                      ),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
