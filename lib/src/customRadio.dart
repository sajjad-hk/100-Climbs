import 'dart:core';

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
