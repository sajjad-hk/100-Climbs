import 'package:flutter/material.dart';
//import 'success.dart';
//import 'grade.dart';
//import 'belay.dart';
//import 'tags.dart';

class RouteWizard extends StatefulWidget {
//  RouteWizard({Key key, this.currentPageIndex, this.onClose}) : super(key: key);

  final int pageIndex;
  final GestureTapCallback onClose;
  final type;

  RouteWizard.creator({this.pageIndex, this.onClose})
      : type = 'NEW',
        super();

  RouteWizard.editor({this.pageIndex, this.onClose})
      : type = 'EDIT',
        super();

  @override
  _RouteWizardState createState() => _RouteWizardState();
}

class _RouteWizardState extends State<RouteWizard> {
  int currentPageIndex;
  bool editor;

  @override
  void initState() {
    super.initState();
    currentPageIndex = 0;
  }

  _previous() {
//    int index = currentPageIndex > 0 ? currentPageIndex - 1 : currentPageIndex;
//    setState(() {
//      currentPageIndex = index;
//    });
  }

  _next() {
//    int index = currentPageIndex < 3 ? currentPageIndex + 1 : currentPageIndex;
//    setState(() {
//      currentPageIndex = index;
//    });
  }

  _buildRouteWizardModal(int ind) {
    List<Widget> pages = <Widget>[
//      _buildRouteWizardWrap(Success()),
//      _buildRouteWizardWrap(Grade()),
//      _buildRouteWizardWrap(Belay()),
//      _buildRouteWizardWrap(Tags()),
      _buildRouteWizardWrap(Text(''))
    ];

    return pages[ind];
  }

  _buildRouteWizardWrap(Widget content) {
    return SizedBox.expand(
      child: Container(
        color: Color(0xffb3000000),
        padding: const EdgeInsets.all(12.0),
        child: GestureDetector(
          onHorizontalDragEnd: (c) {
            if (c.velocity.pixelsPerSecond.dx > 1000) {
              _previous();
            }
            if (c.velocity.pixelsPerSecond.dx < -1000) {
              _next();
            }
          },
          child: Card(
            color: Color(0xffffdd00),
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        padding: const EdgeInsets.all(5.0),
                        icon: Icon(
                          Icons.close,
                          size: 40.0,
                          color: Colors.white,
                        ),
                        onPressed: widget.onClose,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: content,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Visibility(
                        visible: currentPageIndex != 0,
                        child: IconButton(
                          icon: Icon(
                            Icons.navigate_before,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: _previous,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Visibility(
                              visible: currentPageIndex == 3,
                              child: Container(
                                child: Text(
                                  'DONE',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                currentPageIndex == 3
                                    ? Icons.check
                                    : Icons.navigate_next,
                                color: Colors.white,
                                size: 35,
                              ),
                              onPressed: _next,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(RouteWizard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pageIndex != oldWidget.pageIndex) {
      setState(() {
        currentPageIndex = widget.pageIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildRouteWizardModal(currentPageIndex);
  }
}
