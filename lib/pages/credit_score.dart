import 'package:flutter/material.dart';
import 'package:loanlink/r_widgets/r_widgets.dart';

class CreditScore extends StatefulWidget {
  const CreditScore({Key? key}) : super(key: key);

  @override
  State<CreditScore> createState() => _CreditScoreState();
}

class _CreditScoreState extends State<CreditScore> {
  final incomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                const Text(
                  "Credit Score Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      textfield(
                        hintText: "Net Annual Income",
                        icon: Icons.money_rounded,
                        inputType: TextInputType.number,
                        maxLines: 1,
                        capitalization: TextCapitalization.none,
                        controller: incomeController,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
