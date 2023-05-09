import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  //const NewTransaction({Key key}) : super(key: key);
  final Function addTx;

  const NewTransaction(this.addTx, {Key key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  String titleInput;

  String amountInput;

  void submitData() {
    final enterTitle = titleInput;
    final enterAmount = double.parse(amountInput);

    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    widget.addTx(
      titleInput,
      double.parse(amountInput),
    );
    Navigator.of(context).pop();
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
