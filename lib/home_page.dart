import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/loading.dart';
import 'package:wayha_covid_dash/models/covid_model.dart';
import 'package:wayha_covid_dash/providers/covid_stat_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Covid>(
          future: CovidStatProvider.getCovidStat(),
          builder: (context, snapshot) {
            if (snapshot.hasError) Text("Query error occurred!");
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Container(
                  child: Stack(children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 50,
                                  child: Image.asset(
                                      "assets/images/wayha_logo_color.png"),
                                ),
                                Text("ກະດານຂໍ້ມູນສະຖິຕິ Covid-19 ຢູ່ປະເທດລາວ",
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center),
                              ],
                            )),
                        Divider(),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Card(
                                child: Container(
                                  width: 1000,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.local_hospital,
                                        size: 50,
                                        color: Colors.redAccent,
                                      ),
                                      Text("ຕິດເຊື້ອສະສົມ"),
                                      Text(snapshot.data.cases),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Card(
                                child: Container(
                                  width: 1000,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        size: 50,
                                        color: Colors.blueAccent,
                                      ),
                                      Text("ຮັບການກວດເຊື້ອ"),
                                      Text(snapshot.data.testCase),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Card(
                                child: Container(
                                  width: 1000,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        size: 50,
                                        color: Colors.greenAccent,
                                      ),
                                      Text("ບໍ່ຕິດເຊື້ອ"),
                                      Text(snapshot.data.negativeCase),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Card(
                                child: Container(
                                  width: 1000,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.healing,
                                        size: 50,
                                        color: Colors.amber,
                                      ),
                                      Text("ກຳລັງປິ່ນປົວ"),
                                      Text(snapshot.data.healing),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Card(
                                child: Container(
                                  width: 1000,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        size: 50,
                                        color: Colors.green,
                                      ),
                                      Text("ປິ່ນປົວຫາຍດີແລ້ວ"),
                                      Text(snapshot.data.recover),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Card(
                                child: Container(
                                  width: 1000,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.details,
                                        size: 50,
                                        color: Colors.red,
                                      ),
                                      Text("ເສຍຊີວິດ"),
                                      Text(snapshot.data.death),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Positioned(
                        //     right: 0,
                        //     child: Text(
                        //         "Last update: " + DateTime.now().toString())),
                        Center(
                          child: Text(
                              "Developed by Flutter Web : Wayha Technology"),
                        )
                      ],
                    ),
                  ]),
                ),
              );
            } else {
              return Center(
                  child: Loading(
                      indicator: BallBeatIndicator(),
                      size: 60.0,
                      color: Theme.of(context).accentColor));
            }
          }),
    );
  }
}
