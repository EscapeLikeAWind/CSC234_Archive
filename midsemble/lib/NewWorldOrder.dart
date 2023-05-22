import 'package:flutter/material.dart';

import 'package:midsemble/widgets/Description.dart';
import 'package:midsemble/AcrossTEC.dart';

class NewWorldOrder extends StatefulWidget {
  const NewWorldOrder({Key? key}) : super(key: key);

  @override
  State<NewWorldOrder> createState() => _NewWorldOrderState();
}

class _NewWorldOrderState extends State<NewWorldOrder> {
  bool isClick = true;

  @override
  Widget build(BuildContext context) {
    bool isRow = MediaQuery.of(context).size.width > 800;

    return isRow
        ? Row(
            children: [
              const Expanded(flex: 2, child: Description()),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AcrossTEC(
                                title: 'CSC234 Midterm Exam',
                              )),
                    );
                  },
                  child: const Text('Push'),
                ),
              ),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isClick = !isClick;
                    });
                  },
                  child: Image.asset(
                      isClick
                          ? 'assets/images/pavlov/default.png'
                          : 'assets/images/pavlov/pird.jpg',
                      fit: BoxFit.cover),
                ),
              )
            ],
          )
        : Column(
            children: [
              const Expanded(child: Description()),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AcrossTEC(
                                title: 'CSC234 Midterm Exam',
                              )),
                    );
                  },
                  child: const Text('Push'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isClick = !isClick;
                    });
                  },
                  child: Image.asset(
                    isClick
                        ? 'assets/images/pavlov/default.png'
                        : 'assets/images/pavlov/pird.jpg',
                  ),
                ),
              )
            ],
          );
  }
}
