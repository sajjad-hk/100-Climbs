import 'dart:core';

import 'package:climbing_logbook/src/customIcon.dart';
import 'package:flutter/material.dart';

class NewCustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Color checkedBgColor;
  final Color checkedContentColor;
  final Color unCheckedBgColor;
  final String style;
  final String label;
  final String iconProvider;

  NewCustomRadio.col({
    @required this.value,
    @required this.groupValue,
    @required this.checkedBgColor,
    @required this.unCheckedBgColor,
    @required this.checkedContentColor,
    @required this.label,
    this.iconProvider,
    this.onChanged,
  }) : this.style = 'col';

  NewCustomRadio.row({
    @required this.value,
    @required this.groupValue,
    @required this.checkedBgColor,
    @required this.unCheckedBgColor,
    @required this.checkedContentColor,
    @required this.label,
    this.iconProvider,
    this.onChanged,
  }) : this.style = 'row';

  _buildInCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Container(
            child: CustomIcon(
              path: iconProvider,
              color:
                  !(value == groupValue) ? checkedBgColor : checkedContentColor,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color:
                  !(value == groupValue) ? checkedBgColor : checkedContentColor,
            ),
          ),
        )
      ],
    );
  }

  _buildInRow() {
    return Row(
      children: <Widget>[
        if (iconProvider != null)
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              child: CustomIcon(
                path: iconProvider,
                color: !(value == groupValue)
                    ? checkedBgColor
                    : checkedContentColor,
              ),
            ),
          ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color:
                  !(value == groupValue) ? checkedBgColor : checkedContentColor,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: (value == groupValue) ? checkedBgColor : unCheckedBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: InkWell(
        child: style == 'col' ? _buildInCol() : _buildInRow(),
        onTap: () {
          onChanged(value);
        },
      ),
    );
  }
}
