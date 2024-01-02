import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onItemSelected;
  final List<String> drawerItems;

  AppDrawer({required this.onItemSelected, required this.drawerItems});

  @override
  Widget build(BuildContext context) {
    var deviceheight = MediaQuery.of(context).size.height;
    var devicewidth = MediaQuery.of(context).size.width;
    return Drawer(
      child: Container(
        height: deviceheight,
        width: devicewidth,
        child: ListView.builder(
          itemCount: drawerItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(drawerItems[index]),
              onTap: () {
                // Call the provided callback when an item is tapped and pass the selected index.
                onItemSelected(index);
                Navigator.pop(context); // Close the drawer after selection.
              },
            );
          },
        ),
      ),
    );
  }
}
