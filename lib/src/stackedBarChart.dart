import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

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