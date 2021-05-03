import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class DrawerTab extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function onTapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      onTap: onTapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(' Cooking Up!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900)),
          ),
          SizedBox(
            height: 5,
          ),
          buildListTile(
            Icons.restaurant,
            'Meal',
            () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          buildListTile(
            Icons.settings,
            'Filters',
            () => Navigator.of(context)
                .pushReplacementNamed(FiltersScreen.routeName),
          )
        ],
      ),
    );
  }
}
