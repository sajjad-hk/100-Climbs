import 'package:climbing_logbook/src/assets-content/colors/AppColors.dart';
import 'package:climbing_logbook/src/assets-content/icons/AppIcons.dart';
import 'package:climbing_logbook/src/commons/customRadio.dart';
import 'package:climbing_logbook/src/commons/dashLinePainter.dart';
import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:climbing_logbook/src/editeRouteWizard/AppDatePicker.dart';
import 'package:climbing_logbook/src/models/enums.dart';
import 'package:climbing_logbook/src/services/climbingRouteService.dart';
import 'package:climbing_logbook/src/states/greadesCollection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Color chartBackgroundFrom = Color(0xff165571);
final Color chartBackgroundTo = Color(0xff0e1823);

class EditRouteWizard extends StatelessWidget {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    List<String> grades = Constants.grades[GradingStyleEnum.french];
    if (dashboardState.selectedClimbingRoute != null)
      grades =
          Constants.grades[dashboardState.selectedClimbingRoute.gradingStyle];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(null, 60),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [chartBackgroundFrom, chartBackgroundTo],
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: AppColors.getGradeColor(
              dashboardState.selectedClimbingRoute?.grade),
          child: ListView(
            children: <Widget>[
              itemSection('Date', [createDatePicker(context)]),
              itemSection('Succeded?', [createSuccess(context)]),
              itemSection('Scale and Grade', [
                createGradingStyle(context),
                createListViewGradePicker(context, grades)
              ]),
              itemSection('Belay', [createBelayStyle(context)]),
              itemSection('Style', [createClimbingStyle(context)]),
              itemSection('Keywords', [Container()]),
              itemSection('Comments', [Container()]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () => dashboardState.close(),
            ),
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
              onPressed: () {
                climbingRouteService
                    .updateClimbingRoute(dashboardState.selectedClimbingRoute);
                dashboardState.close();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget createDatePicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        AppDatePicker(),
      ],
    );
  }

  Widget createSuccess(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: NewCustomRadio.row(
                value: OutComeEnum.success,
                groupValue: dashboardState.selectedClimbingRoute?.outCome,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Yup',
                fontSize: 16,
                iconProvider: AppIcons.smile,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..outCome = val));
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: NewCustomRadio.row(
                value: OutComeEnum.failure,
                groupValue: dashboardState.selectedClimbingRoute?.outCome,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Nope',
                fontSize: 16,
                iconProvider: AppIcons.sad,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..outCome = val));
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget createGradingStyle(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: NewCustomRadio.row(
                value: GradingStyleEnum.french,
                groupValue: dashboardState.selectedClimbingRoute?.gradingStyle,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'French',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..gradingStyle = val));
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: NewCustomRadio.row(
                value: GradingStyleEnum.polish,
                groupValue: dashboardState.selectedClimbingRoute?.gradingStyle,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Polish',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..gradingStyle = val));
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget createListViewGradePicker(BuildContext context, List<String> grades) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Container(
      height: 68,
      child: ListView.builder(
        itemCount: grades.length,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        addAutomaticKeepAlives: false,
        cacheExtent: grades.length * 68.0,
        itemBuilder: (context, index) {
          if (grades[index] == dashboardState.selectedClimbingRoute?.grade) {
            scrollController.animateTo((index - 2) * 68.0,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          }
          return InkWell(
            onTap: () {
              dashboardState.selectClimbingRoute(dashboardState
                  .selectedClimbingRoute
                  .rebuild((r) => r..grade = grades[index]));
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color:
                    grades[index] == dashboardState.selectedClimbingRoute?.grade
                        ? AppColors.black_30
                        : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: grades[index] !=
                          dashboardState.selectedClimbingRoute?.grade
                      ? AppColors.black_30
                      : Colors.transparent,
                ),
              ),
              child: Center(
                child: Text(
                  grades[index],
                  style: TextStyle(
                    color: grades[index] !=
                            dashboardState.selectedClimbingRoute?.grade
                        ? AppColors.black_30
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget createBelayStyle(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: NewCustomRadio.col(
                value: BelayingStyleEnum.lead,
                groupValue: dashboardState.selectedClimbingRoute?.belayingStyle,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.lead,
                label: 'Lead',
                fontSize: 16,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..belayingStyle = val));
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: NewCustomRadio.col(
                value: BelayingStyleEnum.auto,
                groupValue: dashboardState.selectedClimbingRoute?.belayingStyle,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.auto,
                iconSize: 40,
                label: 'Auto',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..belayingStyle = val));
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 1,
              child: NewCustomRadio.col(
                value: BelayingStyleEnum.toprope,
                groupValue: dashboardState.selectedClimbingRoute?.belayingStyle,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.toprope,
                iconSize: 40,
                label: 'Toprope',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..belayingStyle = val));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget createClimbingStyle(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Row(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: NewCustomRadio.row(
                value: ClosureEnum.onsight,
                groupValue: dashboardState.selectedClimbingRoute?.closure,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'On Sight',
                fontSize: 16,
                iconProvider: AppIcons.eye,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..closure = val));
                },
              ),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AspectRatio(
              aspectRatio: 2.2,
              child: NewCustomRadio.row(
                value: ClosureEnum.flash,
                groupValue: dashboardState.selectedClimbingRoute?.closure,
                checkedBgColor: AppColors.black_30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Flash',
                fontSize: 16,
                iconProvider: AppIcons.flash,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.selectClimbingRoute(dashboardState
                      .selectedClimbingRoute
                      .rebuild((r) => r..closure = val));
                },
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget itemSection(String txt, List<Widget> items) {
    return CustomPaint(
      painter: DashedBorderPainter(
        sides: SideBorders(
          leftSide: false,
          rightSide: false,
          topSide: false,
          bottomSide: true,
        ),
        color: AppColors.black_30,
        strokeWidth: 1.0,
        dashLength: 4.5,
        skipLength: 3.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                createTitle(txt),
              ],
            ),
            ...items,
          ],
        ),
      ),
    );
  }

  Widget createTitle(String title) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 5.0,
        top: 20,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.black_30,
        ),
      ),
    );
  }
}
