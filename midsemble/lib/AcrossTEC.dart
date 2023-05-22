import 'package:flutter/material.dart';

import 'package:midsemble/widgets/CustomTextField.dart';
import 'package:midsemble/widgets/Detail1.dart';
import 'package:midsemble/widgets/Detail2.dart';
import 'package:midsemble/MyCustomForm.dart';

class AcrossTEC extends StatefulWidget {
  const AcrossTEC({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AcrossTEC> createState() => _AcrossTECState();
}

class _AcrossTECState extends State<AcrossTEC> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomTextField(
            controller: myController1,
            path: Detail1.routeName,
            placeholder: "Textfield01",
            color: Colors.blue,
          ),
          CustomTextField(
            controller: myController2,
            path: Detail2.routeName,
            placeholder: "Textfield02",
            color: Colors.amber,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCustomForm(),
                  ));
            },
            child: const Text('Push'),
          ),
        ],
      ),
    );
  }
}
