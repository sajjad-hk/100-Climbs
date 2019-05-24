import 'package:climbing_logbook/src/states/RouteState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'outCome.dart';

class RouteWizard extends StatefulWidget {
  final GestureTapCallback onClose;
  final type;

  RouteWizard.creator({this.onClose})
      : type = 'NEW',
        super();

  RouteWizard.editor({this.onClose})
      : type = 'EDIT',
        super();

  @override
  _RouteWizardState createState() => _RouteWizardState();
}

class _RouteWizardState extends State<RouteWizard> {
  int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = 0;
  }

  _routeWizardWapper() {
    PageController _controller = PageController(initialPage: 0);

    return StreamBuilder(
      builder: (context, snapshot) => SizedBox.expand(
            child: Container(
              color: Color(0xffb3000000),
              padding: const EdgeInsets.all(12.0),
              child: Card(
                color: Color(0xffffdd00),
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
                            onPressed: widget.onClose,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: PageView(
                          controller: _controller,
                          onPageChanged: (ind) {
                            setState(() {
                              currentPageIndex = ind;
                            });
                          },
                          children: <Widget>[
                            OutCome(),
                            InkWell(
                              onTap: () {
                                final route = Provider.of<RouteState>(context);
                                print(route.route.belayingStyle);
                              },
                              child: Container(
                                child: Center(
                                    child: Text(snapshot.data.toString())),
                              ),
                            ),
                            Container(
                              child:
                                  Center(child: Text(snapshot.data.toString())),
                            ),
                            Container(
                              child:
                                  Center(child: Text(snapshot.data.toString())),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
//                padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Visibility(
                            visible: currentPageIndex != 0,
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
                          Container(
//                      padding: const EdgeInsets.all(5.0),
                            child: IconButton(
                              iconSize: 50,
                              icon: Icon(
                                currentPageIndex == 3
                                    ? Icons.check
                                    : Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onPressed: () => _controller.nextPage(
                                    duration: Duration(
                                      milliseconds: 200,
                                    ),
                                    curve: Curves.easeIn,
                                  ),
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
  Widget build(BuildContext context) {
    return _routeWizardWapper();
  }
}
