import 'package:flutter/material.dart';
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return const MaterialApp(
title: 'Retrieve Text Input',
home: MyCustomForm(),
);
}
}
// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
const MyCustomForm({Key? key}) : super(key: key);
@override
_MyCustomFormState createState() => _MyCustomFormState();
}
// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
// Create a text controller and use it to retrieve the current value
// of the TextField.
final myController = TextEditingController();
final List<String> names = <String>[
'Apple',
'Orange',
'Rambutan',
];

@override
void dispose() {
// Clean up the controller when the widget is disposed.
myController.dispose();
super.dispose();
}
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Retrieve Text Input'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: TextField(
controller: myController,
decoration: InputDecoration(
border: OutlineInputBorder(),
hintText: "Enter number between 1 to 3",
),
),
),
floatingActionButton: FloatingActionButton(
// When the user presses the button, show an alert dialog containing
// the text that the user has entered into the text field.
onPressed: () {
var one = int.parse(myController.text)-1;
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: Text('${names[one]}'),
);
});
},
tooltip: 'Show me the value!',
child: const Icon(Icons.text_fields),
),
);
}
}