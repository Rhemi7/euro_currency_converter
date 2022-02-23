import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../data/models/currency_model.dart';
import '../widgets/currency_drop_down_widget.dart';
import '../widgets/primary_button.dart';
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
    const Color(0xff4CA0FE),
    const Color(0xff077BFE),
  ];

  List<CurrencyModel> currencyList = [
    CurrencyModel(name: 'EUR', image: ''),
    CurrencyModel(name: 'EUR', image: ''),
    CurrencyModel(name: 'EUR', image: ''),
  ];

  CurrencyModel selectedFirstCurrency = CurrencyModel(name: 'EUR', image: '');
  CurrencyModel selectedSecondCurrency = CurrencyModel(name: 'EUR', image: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
              const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notes_rounded,
                        color: Color(0xff00D998),
                      )),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Color(0xff00D998),
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
              child: Text(
                'Currency\nCalculator',
                style: TextStyle(
                    color: Color(0xff2479DF),
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
            TestTextField(
              suffixText: 'EUR',
              controller: firstFieldController,
            ),
            TestTextField(
              suffixText: 'PLN',
              controller: secondFieldController,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                children: const [
                  CurrencyDropdownWidget(),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.change_circle_rounded,
                    color: Color(0xff8C8C8C),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CurrencyDropdownWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: PrimaryButton(
                text: 'Convert',
                onPressed: () {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Mid-market exchange rate at 13:38 UTC',
                  style: TextStyle(
                      color: Color(0xff2479DF),
                      decoration: TextDecoration.underline),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xffE5E5E5),
                  radius: 8.0,
                  child: Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      'i',
                      style: TextStyle(color: Color(0xff2479DF)),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25.0, 25.0, 30.0, 35.0),
              width: MediaQuery.of(context).size.width,

              decoration: const BoxDecoration(
                  color: Color(0xff035FD1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 450,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text('Past 30 days', style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: Color(0xff00D899),
                          )                        ],
                      ),
                      Column(
                        children: const [
                          Text('Past 90 days', style: TextStyle(color: Colors.white),),
                          SizedBox(
                            height: 5,
                          ),
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: Color(0xff00D899),
                          )                        ],
                      ),

                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AspectRatio(
                    aspectRatio: 1.20,
                    child: SizedBox(
                      width: double.infinity,
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(

                            // touchTooltipData: LineTouchTooltipData(
                            //   tooltipBgColor: HashColors.colorPink,
                            // ),
                            // touchCallback: (LineTouchResponse touchResponse) {
                            //   // handle it
                            // },
                          ),
                          gridData: FlGridData(
                            show: false,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            show: false,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 22,
                              getTextStyles: (context, value) =>
                              const TextStyle(
                                  color: Color(0xff68737d),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                // case 2:
                                //   return 'MAR';
                                // case 5:
                                //   return 'JUN';
                                // case 8:
                                //   return 'SEP';
                                }
                                return '';
                              },
                              margin: 8,
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              getTextStyles: (context, value) =>
                              const TextStyle(
                                color: Color(0xff67727d),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                              getTitles: (value) {
                                switch (value.toInt()) {
                                // case 1:
                                //   return '10k';
                                // case 3:
                                //   return '30k';
                                // case 5:
                                //   return '50k';
                                }
                                return '';
                              },
                              reservedSize: 28,
                              margin: 12,
                            ),
                          ),
                          borderData: FlBorderData(
                              show: false,
                              border: Border.all(
                                  color: const Color(0xff37434d),
                                  width: 1)),
                          minX: 0,
                          maxX: 30,
                          minY: 0,
                          maxY: 20,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(2.6, 2),
                                FlSpot(4.9, 5),
                                FlSpot(6.8, 3.1),
                                FlSpot(8, 4),
                                FlSpot(9.5, 3),
                                FlSpot(11, 4),
                                FlSpot(12, 5),
                                FlSpot(14, 6),
                                FlSpot(15, 7),
                                FlSpot(16, 8),
                                FlSpot(17, 9),
                                FlSpot(18, 15),
                                FlSpot(19, 12),
                                FlSpot(20, 9),
                                FlSpot(22, 11),
                                FlSpot(23, 12),
                                FlSpot(24, 11),
                                FlSpot(25, 12),
                                FlSpot(27, 12),
                                FlSpot(28, 14),
                                FlSpot(29, 15),
                                FlSpot(30, 18),
                              ],
                              isCurved: true,
                              colors: gradientColors,
                              barWidth: 1.5,
                              isStrokeCapRound: true,
                              dotData: FlDotData(
                                show: false,
                              ),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: gradientColors
                                    .map(
                                        (color) => color.withOpacity(0.2))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      'Get rate alerts straight to your mail box',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  // DropdownButton(items: items, onChanged: onChanged)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}