import 'package:covid_nepal_data/Bloc/get_bloc.dart';
import 'package:covid_nepal_data/Bloc/local_data_bloc.dart';
import 'package:covid_nepal_data/Models/summary.dart';
import 'package:covid_nepal_data/Views/widgets/actor.dart';
import 'package:covid_nepal_data/Views/widgets/data_box.dart';
import 'package:covid_nepal_data/Views/widgets/loader.dart';
import 'package:covid_nepal_data/Views/widgets/network_sensitive.dart';
import 'package:covid_nepal_data/Views/widgets/simple_button_with_icon.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _controller;

  bool isGlobal = true;

  TeddyAnimation animation = TeddyAnimation.fail;

  @override
  void initState() {
    super.initState();
    bloc.fetchGlobalData();
    localBloc.fetchLocalData();
    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
    localBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: SimpleRoundIconButton(
          text: isGlobal ? "Nepal" : "Global",
          onPressed: () {
            if (isGlobal) {
              _controller.nextPage(
                  duration: Duration(seconds: 1), curve: Curves.easeInOutCubic);
            } else {
              _controller.previousPage(
                  duration: Duration(seconds: 1), curve: Curves.easeInOutCubic);
            }
            setState(() {
              isGlobal = !isGlobal;
              isGlobal
                  ? animation = TeddyAnimation.fail
                  : animation = TeddyAnimation.fail2;
            });
          },
        ),
        body: Stack(
          children: <Widget>[
            NetworkSensitive(
              child: PageView(
                onPageChanged: (page) {
                  setState(() {
                    isGlobal = page == 0 ? true : false;
                    isGlobal
                        ? animation = TeddyAnimation.fail
                        : animation = TeddyAnimation.fail2;
                  });
                },
                controller: _controller,
                allowImplicitScrolling: true,
                children: <Widget>[
                  StreamBuilder<GlobalCases>(
                      stream: bloc.globalCaseData,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Column(
                            children: <Widget>[
                              Image.asset('assets/noInternet.png'),
                            ],
                          );
                        }
                        if (snapshot.hasData) {
                          GlobalCases globalCase = snapshot.data;
                          return _buildStats("Global",
                              newConfirmed: globalCase.newConfirmed,
                              newDeaths: globalCase.newDeaths,
                              newRecovered: globalCase.newRecovered,
                              totalConfirmed: globalCase.totalConfirmed,
                              totalDeaths: globalCase.totalDeaths,
                              totalRecovered: globalCase.totalRecovered);
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              CustomLoader(),
                            ],
                          );
                        }
                      }),
                  StreamBuilder<CountryCases>(
                      stream: localBloc.localCaseData,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset('assets/noInternet.png'),
                            ],
                          );
                        }

                        if (snapshot.hasData) {
                          CountryCases globalCase = snapshot.data;
                          return _buildStats("Nepal",
                              newConfirmed: globalCase.newConfirmed,
                              newDeaths: globalCase.newDeaths,
                              newRecovered: globalCase.newRecovered,
                              totalConfirmed: globalCase.totalConfirmed,
                              totalDeaths: globalCase.totalDeaths,
                              totalRecovered: globalCase.totalRecovered);
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CustomLoader(),
                            ],
                          );
                        }
                      })
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // Expanded(
                //   child: SizedBox(),
                // ),
                // Flexible(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       Expanded(
                //         child: bearSays,
                //       ),
                //       Teddy(),
                //     ],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Teddy(
                      animation: animation,
                      onLongPress: () {
                        setState(() {
                          animation = TeddyAnimation.success;
                        });
                      },
                      onTap: () {
                        setState(() {
                          animation = TeddyAnimation.idle;
                        });
                      },
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }

  Widget _buildStats(String title,
      {int newConfirmed,
      int totalConfirmed,
      int newRecovered,
      int totalRecovered,
      int totalDeaths,
      int newDeaths}) {
    return ListView(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, letterSpacing: 5.0, fontSize: 30.0),
        ),
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    DataBox(
                      title: "New Confirmed",
                      data: "$newConfirmed",
                    ),
                    DataBox(
                      title: "Total Confirmed",
                      data: "$totalConfirmed",
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    DataBox(
                      title: "NewRecovered",
                      data: "$newRecovered",
                    ),
                    DataBox(
                      title: "TotalRecovered",
                      data: "$totalRecovered",
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    DataBox(
                      title: "Total Deaths",
                      data: "$totalDeaths",
                    ),
                    DataBox(
                      title: "New Deaths",
                      data: "$newDeaths",
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
