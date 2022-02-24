import 'package:currency_calculator/features/currency_calculator/presentation/notifier/converter_notifier/converter_state.dart';
import 'package:currency_calculator/features/currency_calculator/presentation/utils/constants.dart';
import 'package:currency_calculator/features/currency_calculator/presentation/utils/margins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enum/days_enum.dart';
import '../../data/models/currency_model.dart';
import '../provider/providers.dart';
import '../widgets/blurry_graph_text.dart';
import '../widgets/currency_drop_down_widget.dart';
import '../widgets/currency_text.dart';
import '../widgets/graph_text_days.dart';
import '../widgets/primary_button.dart';
import '../widgets/test_chart.dart';
import '../widgets/test_text_field.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

TextEditingController firstFieldController = TextEditingController();
TextEditingController secondFieldController = TextEditingController();

class _MainScreenState extends State<MainScreen> {
  List<Color> gradientColors = [
    kColorBlueGraph,
    kColorBlueGraphSecond,
  ];

  List<CurrencyModel> currencyList = [
    CurrencyModel(name: 'EUR', image: 'assets/images/euro.png'),
    CurrencyModel(name: 'USD', image: 'assets/images/us.png'),
    CurrencyModel(name: 'AUD', image: 'assets/images/aus.png'),
    CurrencyModel(name: 'CAD', image: 'assets/images/can.png'),
    CurrencyModel(name: 'PLN', image: 'assets/images/poland.png'),
    CurrencyModel(name: 'MXN', image: 'assets/images/mexico.png'),
  ];

  String _selectedFirstCurrency = 'EUR';
  String _selectedSecondCurrency = 'PLN';

  double? rate = 0;

  calculateConvertedValue() {
    context
        .read(converterNotifierProvider.notifier)
        .getRate(_selectedSecondCurrency);

    secondFieldController.text =
        (int.parse(firstFieldController.text) * rate!).toString();
  }

  @override
  void initState() {
    firstFieldController.addListener(calculateConvertedValue);
    secondFieldController.addListener(calculateConvertedValue);
    super.initState();
  }

  @override
  void dispose() {
    firstFieldController.removeListener(calculateConvertedValue);
    secondFieldController.removeListener(calculateConvertedValue);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 18.0, left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notes_rounded,
                          color: kColorGreen,
                        )),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: kColorGreen,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 13.0),
                child: CurrencyCalculatorText(),
              ),
              TestTextField(
                suffixText: _selectedFirstCurrency,
                controller: firstFieldController,
              ),
              Consumer(builder: (context, watch, child) {
                final converterState = watch(converterNotifierProvider);
                if (converterState is ConverterLoading) {
                  return TestTextField(
                    suffixText: _selectedSecondCurrency,
                    controller: secondFieldController,
                  );
                } else if (converterState is ConverterLoaded) {
                  rate = converterState.rate;
                  return TestTextField(
                    suffixText: _selectedSecondCurrency,
                    controller: secondFieldController,
                  );
                } else if (converterState is ConverterError) {
                  return TestTextField(
                    suffixText: "Error",
                    controller: secondFieldController,
                  );
                }
                return TestTextField(
                  suffixText: _selectedSecondCurrency,
                  controller: secondFieldController,
                );
              }),
              const YMargin(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Row(
                  children: [
                    customDropDownWidget(true),
                    // const ,
                    const XMargin(10),
                    const Icon(
                      Icons.sync_alt,
                      color: Color(0xff8C8C8C),
                    ),
                    const XMargin(10),
                    customDropDownWidget(false),
                  ],
                ),
              ),
              const YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: PrimaryButton(
                  text: 'Convert',
                  onPressed: () {
                    context
                        .read(converterNotifierProvider.notifier)
                        .getRate("USD");
                  },
                ),
              ),
              const YMargin(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Mid-market exchange rate at 13:38 UTC',
                    style: TextStyle(
                        color: kColorBlue,
                        decoration: TextDecoration.underline),
                  ),
                  XMargin(10),
                  CircleAvatar(
                    backgroundColor: Color(0xffE5E5E5),
                    radius: 8.0,
                    child: Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Text(
                        'i',
                        style: TextStyle(color: kColorBlue),
                      ),
                    ),
                  )
                ],
              ),
              const YMargin(40),
              bottomContainerWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Container bottomContainerWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 30.0, 35.0),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: kColorBlueBG,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      height: 450,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selected == GraphDays.thirty
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          selected = GraphDays.thirty;
                        });
                      },
                      child: const GraphTextDays('Past 30 days'))
                  : InkWell(
                      onTap: () {
                        setState(() {
                          selected = GraphDays.thirty;
                        });
                      },
                      child: const BlurryGraphText('Past 30 days')),
              selected == GraphDays.ninety
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          selected = GraphDays.ninety;
                        });
                      },
                      child: const GraphTextDays('Past 90 days'))
                  : InkWell(
                      onTap: () {
                        setState(() {
                          selected = GraphDays.ninety;
                        });
                      },
                      child: const BlurryGraphText('Past 90 days')),
            ],
          ),
          const YMargin(20),
          TestChart(gradientColors: gradientColors),

          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Text(
              'Get rate alerts straight to your mail box',
              style: TextStyle(
                  color: Colors.white, decoration: TextDecoration.underline),
            ),
          ),
          // DropdownButton(items: items, onChanged: onChanged)
        ],
      ),
    );
  }

  Expanded customDropDownWidget(bool first) {
    return Expanded(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 7.0),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffF2F2F2), width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<dynamic>(
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xff8C8C8C),
              ),
              value: first ? _selectedFirstCurrency : _selectedSecondCurrency,
              items: currencyList.map((CurrencyModel currency) {
                return DropdownMenuItem(
                    value: currency.name,
                    child: CustomTextWidget(
                      currency: currency.name,
                      image: currency.image,
                    ));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  first
                      ? _selectedFirstCurrency = newValue
                      : _selectedSecondCurrency = newValue;
                });
              }),
        ),
      ),
    );
  }
}
