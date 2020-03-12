import 'package:hundred_climbs/src/assets-content/colors/AppColors.dart';

class ChartStyle {
  static final String grid = '''
			{
		       left: '3%',
		       bottom: '3%',
		       containLabel: true
		  }
  ''';

  static final String backgroundColor = '''
      {
          type: 'linear',
          x: 0,
          y: 0,
          x2: 1,
          y2: 1,
          colorStops: [
              {
                  offset: 0.5, color: '#165571'
              }, 
              {
                  offset: 1, color: '#0e1823'
              }
          ],
          global: false
      }
  ''';

  static final String yAxis = '''
      [{
           type: 'value',
           axisLine: {
               show: false,
               lineStyle: {
                   color: 'white',
               }
           }
      }]
  ''';

  static String getDataZoom(List<String> sessions) {
    double toPercent = 7 / sessions.length * 100;
    return '''
      [{
          type: 'inside',
          start: ${100 - toPercent},
          end: 100
      }]
    ''';
  }

  static String getXAxis(String data) {
    return '''
      [{
          type: 'category',
          data: $data,
          axisTick: {
              show: false,
          },
          color: 'white',
          axisLabel: {
              fontSize: 11,
              rotate: -90,
          },
          axisLine: {
              lineStyle: {
                  color: 'white',
              }
          },
      }]
    ''';
  }

  static String getSeriesTemp(
      String grade, List<int> successes, List<int> failures) {
    return '''
      {
          name: '$grade',
          type: 'bar',
          stack: 'SUCCES',
          barWidth: 12,
          itemStyle: {color: '${AppColors.getGradeCSSColor(grade)}'},
          data: ${successes.toString()},
      },
      {
          name: '$grade',
          type: 'bar',
          stack: 'FAILURE',
          barWidth: 12,
          itemStyle: {
              color: '${AppColors.getGradeCSSColor(grade)}', 
              opacity: 0.4, 
              borderType: 'solid', 
              borderColor: '#8b8b8b'
          },
          data: ${failures.toString()},
      }
    ''';
  }
}
