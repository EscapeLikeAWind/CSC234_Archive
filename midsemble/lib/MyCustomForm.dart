import 'package:flutter/material.dart';

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

  // PASSED YOUR OWN INFO AS initialValue IN THESE CONTROLLER CONSTRUCTORS!!!
  final nameController = TextEditingController(text: 'Poopa Kaewbuapan');
  final idController = TextEditingController(text: '64130500226');
  final mailController = TextEditingController(text: 'poopa.kaew@kmutt.ac.th');
  // PASSED YOUR OWN INFO AS initialValue IN THESE CONTROLLER CONSTRUCTORS!!!

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
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("CSC234 Form Validation"),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (name) {
                      if (name!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(name)) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                              content: Text(
                                  '${nameController.text} ${idController.text} ${mailController.text}'),
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('< pop'),
                ),
              ],
            ),
          )),
      theme: ThemeData.dark(),
    );
  }
}
