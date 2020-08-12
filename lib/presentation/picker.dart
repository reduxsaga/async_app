import 'package:flutter/material.dart';

class PickerControl extends StatelessWidget {
  PickerControl({
    @required this.value,
    @required this.options,
    @required this.onChange,
    @required this.onRefresh,
  });

  final String value;
  final List<String> options;
  final Function(String) onChange;
  final Function onRefresh;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      PopupMenuButton(
        child: Center(
            child: Row(
          children: [Text(value), Icon(Icons.arrow_drop_down)],
        )),
        onSelected: onChange,
        initialValue: value,
        itemBuilder: (context) {
          return options.map((reddit) {
            return PopupMenuItem(
              value: reddit,
              child: Text(reddit),
            );
          }).toList();
        },
      ),
      IconButton(
        icon: Icon(Icons.refresh),
        onPressed: onRefresh,
      )
    ]);
  }
}
