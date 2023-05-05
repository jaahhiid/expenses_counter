import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatelessWidget {
  //const NewTransaction({Key key}) : super(key: key);
  final Function addTx;
  String titleInput;
  String amountInput;

  NewTransaction(this.addTx);

  void submitData() {
    final enterTitle = titleInput;
    final enterAmount = double.parse(amountInput);

    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    addTx(
      titleInput,
      double.parse(amountInput),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        //   margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              onChanged: (value) {
                titleInput = value;
              },
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              onChanged: (value) {
                amountInput = value;
              },
              keyboardType: TextInputType.number,
              onSubmitted: ((_) => submitData()),
              //
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
