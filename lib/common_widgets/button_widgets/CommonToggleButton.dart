import 'package:flutter/material.dart';

class CommonToggleButtons extends StatefulWidget {
  final List<String> labels;
  final ValueChanged<int> onChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final Color fillColor;
  final double borderRadius;

  CommonToggleButtons({
    required this.labels,
    required this.onChanged,
    this.selectedColor = Colors.blue,
    this.unselectedColor = Colors.black,
    this.fillColor = Colors.blue,
    this.borderRadius = 20.0,
  });

  @override
  _CommonToggleButtonsState createState() => _CommonToggleButtonsState();
}

class _CommonToggleButtonsState extends State<CommonToggleButtons> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = List.generate(widget.labels.length, (index) => index == 0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ToggleButtons(
        isSelected: isSelected,
        onPressed: (index) {
          setState(() {
            for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
              isSelected[buttonIndex] = index == buttonIndex;
            }
            widget.onChanged(index);
          });
        },
        children: List.generate(
          widget.labels.length,
              (index) => Container(
                height: 30,
                width: 50,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.labels[index],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
        ),
        color: widget.unselectedColor,
        selectedColor: Colors.white,
        fillColor: widget.fillColor,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
