import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';
import 'package:hundred_climbs/src/assets-content/icons/AppIcons.dart';
import 'package:hundred_climbs/src/climbingRouteWizard/tagItem.dart';
import 'package:hundred_climbs/src/commons/tags/tags.dart';
import 'package:hundred_climbs/src/commons/tags/tagsHistory.dart';
import 'package:hundred_climbs/src/commons/appBar.dart';
import 'package:hundred_climbs/src/commons/customRadio.dart';
import 'package:hundred_climbs/src/commons/dashLinePainter.dart';
import 'package:hundred_climbs/src/dashboard/customDrawer.dart';
import 'package:hundred_climbs/src/dashboard/state/dashboardState.dart';
import 'package:hundred_climbs/src/editeRouteWizard/AppDatePicker.dart';
import 'package:hundred_climbs/src/models/enums.dart';
import 'package:hundred_climbs/src/models/values.dart';
import 'package:hundred_climbs/src/services/climbingRouteService.dart';
import 'package:hundred_climbs/src/states/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditRouteWizard extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EditRouteWizard> {
  final ScrollController scrollController = ScrollController();
  final _commentTextController = TextEditingController();
  final _tagTextController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  List<TagModel> stringTags = List();

  @override
  void didUpdateWidget(Widget oldWidget) {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    List<String> grades = Constants.grades[GradingStyleEnum.french];
    _commentTextController.text = dashboardState.selectedClimbingRoute?.comment;
    final user = Provider.of<AppUser>(context);
    if (dashboardState.selectedClimbingRoute != null)
      grades =
          Constants.grades[dashboardState.selectedClimbingRoute.gradingStyle];
    _tagTextController.addListener(() {
      setState(() {
        stringTags = user.tags
            .where(
              (i) => i.startsWith(_tagTextController.text),
            )
            .take(4)
            .toList()
            .map((i) => TagModel(i, false))
            .toList();
      });
    });
    return Scaffold(
      appBar: PreferredAppBar.main(),
      body: Center(
        child: Container(
          color: AppColors.getGradeColor(
              dashboardState.selectedClimbingRoute?.grade),
          child: ListView(
            controller: _scrollController,
            children: <Widget>[
              itemSection('Date', [createDatePicker(context)]),
              itemSection('Succeded?', [createSuccess(context)]),
              itemSection('Scale and Grade', [
                createListViewGradePicker(context, grades),
              ]),
              itemSection('Belay', [createBelayStyle(context)]),
              itemSection('Tags', [createTagsSection(context)]),
              itemSection('Comments', [createCommentSection(context)]),
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
              padding: const EdgeInsets.all(5.0),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                dashboardState.close();
                FocusScope.of(context).requestFocus(new FocusNode());
              },
            ),
            FlatButton(
              onPressed: () {
                climbingRouteService.removeClimbingRoute(
                    dashboardState.selectedClimbingRoute.documentId);
                dashboardState.close();
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Text(
                    'DELETE',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(5.0),
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                dashboardState.pickClimbingRoute(dashboardState
                    .selectedClimbingRoute
                    .rebuild((r) => r..comment = _commentTextController.text));
                climbingRouteService
                    .updateClimbingRoute(dashboardState.selectedClimbingRoute);
                dashboardState.close();
              },
            )
          ],
        ),
      ),
      drawer: CustomDrawer(accountType: 'gmail'),
    );
  }

  Widget createCommentSection(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black30,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 3,
        keyboardType: TextInputType.text,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(4.0),
          fillColor: AppColors.black30,
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.white,
        ),
        onSubmitted: (value) {
          dashboardState.pickClimbingRoute(dashboardState.selectedClimbingRoute
              .rebuild((r) => r..comment = _commentTextController.text));
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        controller: _commentTextController,
      ),
    );
  }

  Widget createTagsSection(BuildContext context) {
    final dashboardState = Provider.of<DashboardState>(context);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: _tagTextController.text.isEmpty,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 'EDITE_TAGS',
                  onPressed: () => dashboardState.openTagsEdit(),
                  elevation: 0,
                  mini: true,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  backgroundColor: Color(0xff4c000000),
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: _tagTextController.text != '',
          child: TagsHistory(
            tags: stringTags,
            onAdd: (tag) {
              _tagTextController.text = '';
              FocusScope.of(context).requestFocus(new FocusNode());
              dashboardState.pickClimbingRoute(dashboardState
                  .selectedClimbingRoute
                  .rebuild((r) => r..tags.add(tag)));
            },
          ),
        ),
        Visibility(
          visible: _tagTextController.text == '',
          child: Container(
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                if (dashboardState.selectedClimbingRoute != null)
                  for (String tag in dashboardState.selectedClimbingRoute?.tags)
                    TagItem(
                      text: tag,
                      onTab: (t) {
                        dashboardState.pickClimbingRoute(
                          dashboardState.selectedClimbingRoute.rebuild(
                            (r) => r..tags.remove(t),
                          ),
                        );
                      },
                    )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget createDatePicker(BuildContext context) {
    return Row(
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
              aspectRatio: 2.7,
              child: NewCustomRadio.row(
                value: OutComeEnum.success,
                groupValue: dashboardState.selectedClimbingRoute?.outCome,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Yup',
                fontSize: 16,
                iconProvider: AppIcons.smile,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.pickClimbingRoute(dashboardState
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
              aspectRatio: 2.7,
              child: NewCustomRadio.row(
                value: OutComeEnum.failure,
                groupValue: dashboardState.selectedClimbingRoute?.outCome,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Nope',
                fontSize: 16,
                iconProvider: AppIcons.sad,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.pickClimbingRoute(dashboardState
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
              aspectRatio: 2.7,
              child: NewCustomRadio.row(
                value: GradingStyleEnum.french,
                groupValue: dashboardState.selectedClimbingRoute?.gradingStyle,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'French',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.pickClimbingRoute(dashboardState
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
              aspectRatio: 2.7,
              child: NewCustomRadio.row(
                value: GradingStyleEnum.polish,
                groupValue: dashboardState.selectedClimbingRoute?.gradingStyle,
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                label: 'Polish',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.pickClimbingRoute(dashboardState
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
      height: 48,
      child: ListView.builder(
        itemCount: grades.length,
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        addAutomaticKeepAlives: false,
        cacheExtent: grades.length * 68.0,
        itemBuilder: (context, index) {
          if (grades[index] == dashboardState.selectedClimbingRoute?.grade) {
            scrollController.animateTo((index - 2) * 72.0,
                duration: Duration(milliseconds: 200), curve: Curves.easeIn);
          }
          return InkWell(
            onTap: () {
              dashboardState.pickClimbingRoute(dashboardState
                  .selectedClimbingRoute
                  .rebuild((r) => r..grade = grades[index]));
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                color:
                    grades[index] == dashboardState.selectedClimbingRoute?.grade
                        ? AppColors.black30
                        : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(
                  color: grades[index] !=
                          dashboardState.selectedClimbingRoute?.grade
                      ? AppColors.black30
                      : Colors.transparent,
                ),
              ),
              child: Center(
                child: Text(
                  grades[index],
                  style: TextStyle(
                    color: grades[index] !=
                            dashboardState.selectedClimbingRoute?.grade
                        ? AppColors.black30
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
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.lead,
                label: 'Lead',
                fontSize: 16,
                iconSize: 40,
                onChanged: (val) {
                  dashboardState.pickClimbingRoute(dashboardState
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
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.auto,
                iconSize: 40,
                label: 'Auto',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.pickClimbingRoute(dashboardState
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
                checkedBgColor: AppColors.black30,
                unCheckedBgColor: Colors.transparent,
                checkedContentColor: Colors.white,
                iconProvider: AppIcons.toprope,
                iconSize: 40,
                label: 'Toprope',
                fontSize: 16,
                onChanged: (val) {
                  dashboardState.pickClimbingRoute(dashboardState
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

  Widget itemSection(String txt, List<Widget> items) {
    return CustomPaint(
      painter: DashedBorderPainter(
        sides: SideBorders(
          leftSide: false,
          rightSide: false,
          topSide: false,
          bottomSide: true,
        ),
        color: AppColors.black30,
        strokeWidth: 1.0,
        dashLength: 4.5,
        skipLength: 3.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
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
        left: 10.0,
        bottom: 5.0,
        top: 20,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.black30,
        ),
      ),
    );
  }
}
