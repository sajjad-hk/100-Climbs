import 'package:climbing_logbook/src/dashboard/state/dashboardState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Type { MAIN, TAG }

class PreferredAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size _size;
  final Type _type;

  PreferredAppBar.main()
      : _type = Type.MAIN,
        _size = Size(null, 60);

  PreferredAppBar.tag()
      : _type = Type.TAG,
        _size = Size(null, 60);

  @override
  Widget build(BuildContext context) {
    DashboardState ds = Provider.of<DashboardState>(context);
    return PreferredSize(
      preferredSize: _size,
      child: Container(
        color: Colors.black,
        child: Row(
          children: <Widget>[
            LayoutBuilder(
              builder: (context, constraint) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: IconButton(
                    icon: Icon(
                      _type == Type.MAIN ? Icons.menu : Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (_type == Type.MAIN)
                        Scaffold.of(context).openDrawer();
                      else
                        ds.closeTagEdit();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => _size;
}
