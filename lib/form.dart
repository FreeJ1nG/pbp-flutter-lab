import 'package:counter_7/data.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/models/transaction_data.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage(
      {super.key, required this.transactions, required this.saveTransaction});
  final Function(Transaction newTransaction) saveTransaction;
  final List<Transaction> transactions;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  num _nominal = 0;
  String _transactionType = "Pemasukan";
  DateTime selectedDate = DateTime.now();
  List<String> transactionTypeChoices = ["Pemasukan", "Pengeluaran"];

  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2120));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        drawer: DrawerApp(
            saveTransaction: widget.saveTransaction,
            transactions: widget.transactions),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Judul",
                        labelText: "Judul",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _title = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _title = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Nominal",
                        labelText: "Nominal",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _nominal = double.parse(value!);
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _nominal = double.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        if (double.tryParse(value) == null) {
                          return "Input harus angka";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("${selectedDate.toLocal()}".split(" ")[0]),
                          const SizedBox(
                            height: 8.0,
                          ),
                          ElevatedButton(
                              onPressed: () => _selectedDate(context),
                              child: const Text("Select Date"))
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      value: _transactionType,
                      items: transactionTypeChoices.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _transactionType = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.saveTransaction(Transaction(
                    _title, _nominal, _transactionType, selectedDate));
                _title = "";
                _nominal = 0;
                selectedDate = DateTime.now();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyDataPage(
                              saveTransaction: widget.saveTransaction,
                              transactions: widget.transactions,
                            )));
              }
            },
            child: const Text(
              "Simpan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}
