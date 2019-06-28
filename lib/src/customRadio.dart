import 'dart:core';

import 'package:climbing_logbook/src/customIcon.dart';
import 'package:climbing_logbook/src/icons/LogBookIcons.dart';
import 'package:flutter/material.dart';

class CustomRadio<T> extends StatefulWidget {
  CustomRadio(
      {Key key,
      @required this.value,
      @required this.groupValue,
      @required this.onChanged,
      this.checked,
      this.notChecked})
      : super(key: key);

  final ValueChanged<T> onChanged;
  final T value;
  final T groupValue;
  final Widget checked;
  final Widget notChecked;

  @override
  State<StatefulWidget> createState() {
    return CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  CustomRadioState();
  double _opacity;

  @override
  void initState() {
    super.initState();
    _opacity = widget.value == widget.groupValue ? 1 : 0;
  }

  @override
  Widget build(BuildContext context) {
    _opacity = widget.value == widget.groupValue ? 1 : 0;
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          curve: Curves.easeOutCubic,
          opacity: _opacity,
          duration: const Duration(milliseconds: 400),
          child: InkWell(
            onTap: () {
              widget.onChanged(widget.value);
            },
            child: widget.checked,
          ),
        ),
        AnimatedOpacity(
          opacity: 1 - _opacity,
          duration: const Duration(milliseconds: 400),
          child: InkWell(
            onTap: () {
              widget.onChanged(widget.value);
            },
            child: widget.notChecked,
          ),
        )
      ],
    );
  }
}

class ToggleRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Widget checkedIcon;
  final Widget notCheckedIcon;
  final String label;
  final String viewStyle;

  ToggleRadio.rowStyle({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    @required this.label,
    this.checkedIcon,
    this.notCheckedIcon,
  })  : viewStyle = 'ROW',
        super(key: key);

  ToggleRadio.columnStyle({
    Key key,
    @required this.value,
    @required this.groupValue,
    @required this.onChanged,
    @required this.label,
    this.checkedIcon,
    this.notCheckedIcon,
  })  : viewStyle = 'COLUMN',
        super(key: key);

  _buildView(String style, bool checked) {
    switch (style) {
      case 'ROW':
        return _buildViewRowStyle(checked);
        break;
      case 'COLUMN':
        return _buildViewColumnStyle(checked);
        break;
      default:
    }
  }

  _buildViewColumnStyle(bool checked) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        if (checked != null && notCheckedIcon != null)
          checked ? checkedIcon : notCheckedIcon,
        Container(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            label,
            style: TextStyle(
              color: checked ? Colors.white : Color(0x4d000000),
              fontFamily: 'Arial-MT-Bold',
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }

  _buildViewRowStyle(bool checked) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (checked != null && notCheckedIcon != null)
          checked ? checkedIcon : notCheckedIcon,
        Text(
          label,
          style: TextStyle(
            color: checked ? Colors.white : Color(0x4d000000),
            fontFamily: 'Arial-MT-Bold',
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomRadio(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      checked: Container(
        decoration: BoxDecoration(
          color: Color(0x4d000000),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Center(
          child: _buildView(viewStyle, true),
        ),
      ),
      notChecked: Container(
        child: Center(
          child: _buildView(viewStyle, false),
        ),
      ),
    );
  }
}

class NewCustomRadio<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final Color checkedBgColor;
  final Color checkedContentColor;
  final Color unCheckedBgColor;
  final String style;
  final String label;

  NewCustomRadio.col({
    @required this.value,
    @required this.groupValue,
    @required this.checkedBgColor,
    @required this.unCheckedBgColor,
    @required this.checkedContentColor,
    @required this.label,
    this.onChanged,
  }) : this.style = 'col';

  NewCustomRadio.row({
    @required this.value,
    @required this.groupValue,
    @required this.checkedBgColor,
    @required this.unCheckedBgColor,
    @required this.checkedContentColor,
    @required this.label,
    this.onChanged,
  }) : this.style = 'row';

  @override
  _NewCustomRadioState createState() => _NewCustomRadioState();
}

class _NewCustomRadioState extends State<NewCustomRadio> {
  Color color;
  bool checked = false;

  @override
  void initState() {
    color = checked ? widget.checkedBgColor : widget.unCheckedBgColor;
    super.initState();
  }

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
              path: LogBookIcons.smile,
              color:
                  !checked ? widget.checkedBgColor : widget.checkedContentColor,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color:
                  !checked ? widget.checkedBgColor : widget.checkedContentColor,
            ),
          ),
        )
      ],
    );
  }

  _buildInRow() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
            child: CustomIcon(
              path: 'assets/icons/icon_lead_active.png',
              color:
                  !checked ? widget.checkedBgColor : widget.checkedContentColor,
            ),
          ),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              color:
                  !checked ? widget.checkedBgColor : widget.checkedContentColor,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 140,
      height: 140,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: checked ? widget.checkedBgColor : widget.unCheckedBgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: InkWell(
        child: widget.style == 'col' ? _buildInCol() : _buildInRow(),
        onTap: () {
          setState(() {
            checked = !checked;
          });
        },
      ),
    );
  }
}
