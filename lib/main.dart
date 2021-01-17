import 'package:flutter/material.dart';

void main () {
  runApp(
    MaterialApp(
      title: "Stateful App Example",
      home: FavoriteCity(),
    )
  );


}
//create a class that extends a "Stateful widget ", that returns a state in a "crateState()
class FavoriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavoriteCityState();
  }

}
//create a "State "  class , with properties that may change.
//within "State" class, implement the "build()" method.
// "_"  is meanly using for the private class.
class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = " ";
  var _currencies = ['Taka', 'Dollars','Pounds','Rupees'];
  var currentItemSelected = 'Taka';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    debugPrint("Favorite City widget is created");
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Example"),
      ),
      body:Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
         children: <Widget>[
           TextField(
             onSubmitted: (String userInput){
               setState(() {
                 debugPrint("set state is called, this tells framework to redraw the FavCity widget");
                 nameCity = userInput;
               });

             },
           ),
           DropdownButton<String>(
             items: _currencies.map((String dropDownStringItem) {
               return DropdownMenuItem<String>(
                 value:dropDownStringItem,
                 child: Text(dropDownStringItem),
               );
             }).toList(),


             onChanged: (String newValueSelected){
              //code to execute , when a menu item is selected from drop down appear by the user
               _onDropDownItemSelected(newValueSelected);

             },

             value: currentItemSelected,

           ),
           Padding(
             padding: EdgeInsets.all(30.0),
             child: Text(
             "Your next city is $nameCity",
             style: TextStyle(fontSize: 20.0),
           ))
         ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected){
    setState(() {
      this.currentItemSelected = newValueSelected;
    });
  }

}