import 'package:flutter/material.dart';
import 'package:loanlink/r_widgets/r_widgets.dart';

class CreditScore extends StatefulWidget {
  const CreditScore({Key? key}) : super(key: key);

  @override
  State<CreditScore> createState() => _CreditScoreState();
}

const List<String> items = <String>['Home Loan', 'Car Loan', 'Personal Loan'];
String? _selectedValue;

class _CreditScoreState extends State<CreditScore> {
  final incomeController = TextEditingController();
  final expenseController = TextEditingController();
  final loanTypeController = TextEditingController();
  final loanController = TextEditingController();
  final liabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
          child: Column(
            children: [
              Row(
                children:<Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Credit Score Information",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                margin: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    textfield(
                      hintText: "Last 3Yr Annual Income",
                      icon: Icons.money_rounded,
                      inputType: TextInputType.number,
                      maxLines: 1,
                      capitalization: TextCapitalization.none,
                      controller: incomeController,
                    ),
                    textfield(
                      hintText: "Annual Expense",
                      icon: Icons.money_off_rounded,
                      inputType: TextInputType.number,
                      maxLines: 1,
                      capitalization: TextCapitalization.none,
                      controller: expenseController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: const EdgeInsets.all(18.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.purple,
                            ),
                            child: const Icon(
                              Icons.article_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          alignLabelWithHint: true,
                          border: InputBorder.none,
                          fillColor: Colors.purple.shade50,
                          filled: true,
                        ),
                        hint: const Text("Loan Type"),
                        value: _selectedValue,
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _selectedValue = value ?? "";
                          });
                        },
                      ),
                    ),
                    textfield(
                      hintText: "Loan Amount",
                      icon: Icons.account_balance_rounded,
                      inputType: TextInputType.number,
                      maxLines: 1,
                      capitalization: TextCapitalization.none,
                      controller: loanController,
                    ),
                    textfield(
                      hintText: "Liablities",
                      icon: Icons.account_balance_wallet_rounded,
                      inputType: TextInputType.number,
                      maxLines: 1,
                      capitalization: TextCapitalization.none,
                      controller: liabilityController,
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
