import 'package:flutter/material.dart';

class TagsHistory extends StatelessWidget {
  final List<String> tags;
  final Function onAdd;

  TagsHistory({@required this.tags, @required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      constraints: BoxConstraints(
        maxHeight: 100,
      ),
      child: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => onAdd(tags[index]),
            child: Container(
              margin: const EdgeInsets.all(0.5),
              padding: const EdgeInsets.all(2.5),
              color: Color(0xff4c000000),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      tags[index],
                      style: TextStyle(color: Colors.white),
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
