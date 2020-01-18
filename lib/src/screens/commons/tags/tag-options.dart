import 'package:hundred_climbs/src/screens/screens.dart';
import 'package:flutter/material.dart';

class TagsHistory extends StatelessWidget {
  final List<TagModel> tags;
  final Function onTagTap;

  TagsHistory({@required this.tags, @required this.onTagTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      constraints: BoxConstraints(
        maxHeight: 300,
      ),
      child: ListView.builder(
        itemCount: tags.length,
        itemBuilder: (BuildContext context, int index) {
          TagModel tag = tags[index];

          return InkWell(
            onTap: () => onTagTap(tags[index]),
            child: Container(
              margin: const EdgeInsets.all(1),
              padding: const EdgeInsets.all(8.0),
              decoration: new BoxDecoration(
                color: Colors.black26,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    offset: new Offset(2.0, 2.0),
                    blurRadius: 20.0,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      tags[index].value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  tag.isAlreadyAdded
                      ? Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : Icon(
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
