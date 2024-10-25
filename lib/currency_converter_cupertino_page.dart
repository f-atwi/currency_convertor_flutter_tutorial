import 'package:currency_converter/formatters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double result = 0;
  final textEditingController = TextEditingController();
  final textInputFormatters = [
    FilteringTextInputFormatter.allow(RegExp(r"[\d\.]")),
    SinglePeriodEnforcer(),
  ];

  @override
  void initState() {
    super.initState();
    result = 0;
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text("Currency Converter"),
      ),
      backgroundColor: CupertinoColors.systemGrey3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "EUR ${result == 0 ? result.toStringAsFixed(0) : result.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: CupertinoColors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: CupertinoColors.black,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: "Please enter amount in USD",
                prefix: const Icon(CupertinoIcons.money_dollar),
                inputFormatters: textInputFormatters,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              child: CupertinoButton(
                onPressed: () {
                  setState(() {
                    result = double.parse(textEditingController.text) * .9;
                  });
                },
                color: CupertinoColors.black,
                child: const Text("Convert"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
