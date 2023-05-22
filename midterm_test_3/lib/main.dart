import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
      theme: ThemeData.dark(),
      routes: {'/second': (context) => const SecondScreen()},
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  // late FocusNode myFocusNode;

  final nameController = TextEditingController(text: 'Yi Lan Ma');
  final idController = TextEditingController(text: '64130500226');
  final mailController = TextEditingController(text: 'poopa.kaew@kmutt.ac.th');

  @override
  void initState() {
    super.initState();

    // nameController.addListener(_getLatestValue);

    // myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // myFocusNode.dispose();
    nameController.dispose();
    idController.dispose();
    mailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/tak.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red[500],
              ),
              Icon(
                Icons.audiotrack,
                color: Colors.green[500],
              ),
              Icon(
                Icons.beach_access,
                color: Colors.blue[500],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: (name) {
                if (name!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(name)) {
                  return 'Please enter some valid input somehow ^[a-z A-Z]+\$';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Full name',
              ),
              autofocus: true,
              controller: nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: (id) {
                if (id!.isEmpty || !RegExp(r'^[0-9]{11}$').hasMatch(id)) {
                  return 'Please enter some valid input somehow ^[0-9]{11}\$';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Student ID',
              ),
              controller: idController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              // The validator receives the text that the user has entered.
              validator: (mail) {
                if (mail!.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(mail)) {
                  return 'Please enter some valid input somehow ^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your KMUTT email',
              ),
              controller: mailController,
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pushNamed('/second', arguments: {
                    'name': nameController.text,
                    'id': idController.text,
                    'mail': mailController.text,
                  });
                }
              },
              child: const Text('Submit Data'),
            ),
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trio =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final name = trio['name'] as String;
    final id = trio['id'] as String;
    final mail = trio['mail'] as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$name\n',
            ),
            Text(
              '$id\n',
            ),
            Text(mail),
          ],
        ),
      ),
    );
  }
}
