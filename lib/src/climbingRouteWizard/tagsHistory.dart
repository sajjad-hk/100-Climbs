import 'package:flutter/material.dart';

class TagsHistory extends StatelessWidget {
  final List<String> tags;
  final Function onAdd;

  TagsHistory({@required this.tags, @required this.onAdd});

  @override
  Widget build(BuildContext context) {
    var ts = tags ?? [];
    return Container(
      padding: const EdgeInsets.all(15.0),
      constraints: BoxConstraints(
        maxHeight: 200,
      ),
      child: ListView.builder(
        itemCount: ts.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => onAdd(ts[index]),
            child: Container(
              margin: const EdgeInsets.all(0.5),
              padding: const EdgeInsets.all(8.0),
              color: Color(0xff4c000000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      ts[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
