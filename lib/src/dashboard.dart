import 'package:charts_flutter/flutter.dart' as charts;
import 'package:climbing_logbook/src/climbingRoutes.dart';
import 'package:climbing_logbook/src/customDrawer.dart';
import 'package:climbing_logbook/src/models/values.dart';
import 'package:climbing_logbook/src/routeWizard.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteList.dart';
import 'package:climbing_logbook/src/states/ClimbingRouteState.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum RouteWizardMode { CREATE, EDIT, NONE }

final Color listBackground = Color(0xffd8e2e5);
final Color appBarBackground = Color(0xFF000000);
final Color chartBackgroundFrom = Color(0xff165571);
final Color chartBackgroundTo = Color(0xff0e1823);

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  RouteWizardMode _mode = RouteWizardMode.NONE;
  String chartFilter;

  final c = ClimbingRouteList();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ClimbingRouteState>(
            builder: (context) => ClimbingRouteState(),
          ),
        ],
        child: Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: listBackground,
              body: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text("CLIMBING LOGBOOK"),
                    centerTitle: true,
                    leading: Builder(
                      builder: (context) => IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                    ),
                    backgroundColor: appBarBackground,
                    floating: true,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Column(
                          children: <Widget>[
//                            Expanded(
//                              flex: 1,
//                              child: Container(
//                                child: Row(
//                                  mainAxisAlignment:
//                                      MainAxisAlignment.spaceEvenly,
//                                  children: <Widget>[
//                                    Container(
//                                      height: 40,
//                                      width: 100,
//                                      child: ToggleRadio.rowStyle(
//                                        label: 'Lead',
//                                        value: 'Lead',
//                                        groupValue: chartFilter,
//                                        onChanged: (String value) {
//                                          setState(() {
//                                            chartFilter = value;
//                                          });
//                                        },
//                                      ),
//                                    ),
//                                    Container(
//                                      height: 40,
//                                      width: 100,
//                                      child: ToggleRadio.rowStyle(
//                                        label: 'Top Rope',
//                                        value: 'Top Rope',
//                                        groupValue: chartFilter,
//                                        onChanged: (String value) {
//                                          setState(() {
//                                            chartFilter = value;
//                                          });
//                                        },
//                                      ),
//                                    ),
//                                    Container(
//                                      height: 40,
//                                      width: 100,
//                                      child: ToggleRadio.rowStyle(
//                                        label: 'Auto',
//                                        value: 'Auto',
//                                        groupValue: chartFilter,
//                                        onChanged: (String value) {
//                                          setState(() {
//                                            chartFilter = value;
//                                          });
//                                        },
//                                      ),
//                                    )
//                                  ],
//                                ),
//                                  ),
//                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                child: StackedBarChart.withSampleData(),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [chartBackgroundFrom, chartBackgroundTo],
                          ),
                        ),
                      ),
                    ),
                    expandedHeight: 300,
                  ),
                  StreamBuilder<List<ClimbingRoute>>(
                    stream: c.getRouteList(user.uid),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ClimbingRoutes(
                          routes: snapshot.data,
                        );
                      } else {
                        return SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Center(
                                child: Text('Loading...'),
                              )
                            ],
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
              floatingActionButton: FloatingActionButton(
                elevation: 3.0,
                onPressed: () {
                  setState(() => _mode = RouteWizardMode.CREATE);
                },
                child: Icon(
                  Icons.add,
                  size: 45.0,
                ),
                backgroundColor: Color(0xffffdd00),
              ),
              drawer: CustomDrawer(
                  accountType: 'Google'), // todo change static account type
            ),
            if (_mode == RouteWizardMode.CREATE)
              RouteWizard.creator(
                onClose: () {
                  setState(
                    () => _mode = RouteWizardMode.NONE,
                  );
                },
              ),
            if (_mode == RouteWizardMode.EDIT)
              RouteWizard.editor(
                onClose: () {
                  setState(
                    () => _mode = RouteWizardMode.NONE,
                  );
                },
              )
          ],
        ),
      ),
    );
  }
}

class StackedBarChart extends StatelessWidget {
  final List<charts.Series<OrdinalSales, DateTime>> seriesList;
  final bool animate;

  StackedBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedBarChart.withSampleData() {
    return new StackedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.stacked,
        strokeWidthPx: 2.0,
      ),
      behaviors: [
        // Add the sliding viewport behavior to have the viewport center on the
        // domain that is currently selected.
        new charts.SlidingViewport(),
        // A pan and zoom behavior helps demonstrate the sliding viewport
        // behavior by allowing the data visible in the viewport to be adjusted
        // dynamically.
        new charts.PanAndZoomBehavior(),
      ],
      domainAxis: new charts.DateTimeAxisSpec(
        viewport: new charts.DateTimeExtents(
            start: DateTime(2018, 3), end: DateTime(2018, 10)),
        renderSpec: new charts.SmallTickRendererSpec(
          // Tick and Label styling here.
          minimumPaddingBetweenLabelsPx: 0,
          labelStyle: new charts.TextStyleSpec(
              fontSize: 14, // size in Pts.
              color: charts.MaterialPalette.white),

          // Change the line colors to match text color.
          lineStyle:
              new charts.LineStyleSpec(color: charts.MaterialPalette.white),
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        renderSpec: new charts.GridlineRendererSpec(
          labelAnchor: charts.TickLabelAnchor.after,
          // Tick and Label styling here.
          labelStyle: new charts.TextStyleSpec(
            fontSize: 14, // size in Pts.

            color: charts.MaterialPalette.white,
          ),
          minimumPaddingBetweenLabelsPx: 10,
          // Change the line colors to match text color.
          lineStyle: new charts.LineStyleSpec(
            color: charts.MaterialPalette.white,
          ),
        ),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, DateTime>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales(DateTime(2018, 3), 5, Color(0xffffe600)),
      new OrdinalSales(DateTime(2018, 4), 5, Color(0xffffe600)),
      new OrdinalSales(DateTime(2018, 5), 5, Color(0xffffe600)),
      new OrdinalSales(DateTime(2018, 6), 25, Color(0xffffe600)),
      new OrdinalSales(DateTime(2018, 7), 100, Color(0xffffe600)),
      new OrdinalSales(DateTime(2018, 8), 75, Color(0xffffe600)),
    ];

    final tableSalesData = [
      new OrdinalSales(DateTime(2018, 3), 45, Color(0xffffc400)),
      new OrdinalSales(DateTime(2018, 4), 25, Color(0xffffc400)),
      new OrdinalSales(DateTime(2018, 5), 25, Color(0xffffc400)),
      new OrdinalSales(DateTime(2018, 6), 50, Color(0xffffc400)),
      new OrdinalSales(DateTime(2018, 7), 10, Color(0xffffc400)),
      new OrdinalSales(DateTime(2018, 8), 20, Color(0xffffc400)),
    ];

    final mobileSalesData = [
      new OrdinalSales(DateTime(2018, 4), 10, Color(0xfffca138)),
      new OrdinalSales(DateTime(2018, 5), 10, Color(0xfffca138)),
      new OrdinalSales(DateTime(2018, 6), 15, Color(0xfffca138)),
      new OrdinalSales(DateTime(2018, 7), 50, Color(0xfffca138)),
      new OrdinalSales(DateTime(2018, 8), 45, Color(0xfffca138)),
    ];

    final hsetd = [
      new OrdinalSales(DateTime(2018, 7), 10, Color(0xfff96d01)),
    ];
    final hsetd2 = [
      new OrdinalSales(DateTime(2018, 3), 16, Color(0xffff4534)),
      new OrdinalSales(DateTime(2018, 7), 6, Color(0xffff4534)),
    ];

    return [
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.dateTime,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.dateTime,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, DateTime>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.dateTime,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: mobileSalesData,
      ),
      charts.Series<OrdinalSales, DateTime>(
        id: 'h',
        domainFn: (OrdinalSales sales, _) => sales.dateTime,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: hsetd,
      ),
      charts.Series<OrdinalSales, DateTime>(
        id: 'h2',
        domainFn: (OrdinalSales sales, _) => sales.dateTime,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        colorFn: (OrdinalSales sales, _) =>
            charts.ColorUtil.fromDartColor(sales.color),
        data: hsetd2,
      )
    ].reversed.toList();
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final DateTime dateTime;
  final int sales;
  Color color;

  OrdinalSales(this.dateTime, this.sales, this.color);
}
