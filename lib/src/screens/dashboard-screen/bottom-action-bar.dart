import 'package:flutter/material.dart';
import 'package:hundred_climbs/src/services/climbService.dart';
import 'package:hundred_climbs/src/store/store.dart';
import 'package:provider/provider.dart';

class BottomActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context);
    return BottomAppBar(
      color: Colors.black,
      child: Visibility(
        visible: store.climbs.isNotEmpty,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: IconButton(
                  onPressed: () => store.clearClimbs(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Center(
                  child: Text(
                    '${store.numberOfClimbs()} Route${store.numberOfClimbs() > 1 ? 's' : ''} selected',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: FlatButton(
                  onPressed: () {
                    climbService.deleteClimbs(
                        store.climbs.map((i) => i.documentId).toList());
                    store.clearClimbs();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.delete,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'DELETE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
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
    );
  }
}
