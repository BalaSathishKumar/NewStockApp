import 'package:flutter/material.dart';

class CommonSearch extends StatefulWidget {
  final ValueChanged<String>? onSearchTextChanged;
  final String hinttxt;
 final  FocusNode? onFocusNode;
  CommonSearch({this.onSearchTextChanged,required this.hinttxt,this.onFocusNode});

  @override
  _CommonSearchState createState() => _CommonSearchState();
}

class _CommonSearchState extends State<CommonSearch> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          focusNode: widget.onFocusNode,
          controller: _controller,
          onChanged: (value) {
            if (widget.onSearchTextChanged != null) {
              widget.onSearchTextChanged!(value);
            }
          },
          decoration: InputDecoration(
            hintText:  widget.hinttxt,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            prefixIcon: IconButton(icon: Icon(Icons.search),onPressed: (){}),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),

              onPressed: () {
                _controller.clear();
                if (widget.onSearchTextChanged != null) {
                  widget.onSearchTextChanged!('');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
