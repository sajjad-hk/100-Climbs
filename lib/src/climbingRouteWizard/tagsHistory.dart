import 'package:flutter/material.dart';

class TagsHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 250,
      ),
      child: Container(
        child: ListView.builder(
          itemCount: 10, //climbingRoteState.usersTags.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
//                climbingRoteState.tag =
//                    climbingRoteState.usersTags.toList()[index];
              },
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
                        '',
                        //climbingRoteState.usersTags[index],
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
      ),
    );
  }
}
