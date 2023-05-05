import './widgets/user_transaction.dart';
import 'package:flutter/material.dart';
// import './widgets/transaction_list.dart';
// import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String titleInput;
  String amountInput;

  // final titleControler = TextEditingController();
  // final amountControler = TextEditingController();

  //const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Card(
              color: Colors.green,
              child: Container(
                width: double.infinity,
                height: 50,
                child: Text('CHART!'),
              ),
              elevation: 5,
            ),
            // Card(
            //   child: Text('List of TX'),
            // )
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
