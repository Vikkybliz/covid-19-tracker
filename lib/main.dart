import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/coronaApi.dart';
import 'package:new_app/fetchData.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<CoronaApi> fetchCorona;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCorona = getCoronaApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Covid 19 Tracker',
            ),
            centerTitle: true,
          ),
          body: FutureBuilder<CoronaApi>(
              future: fetchCorona,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'This app tracks Covid 19 data in real time',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('World Population'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${snapshot.data!.population}')
                              ],
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            color: Colors.pink,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Number of Cases',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${snapshot.data!.cases}')
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            color: Colors.yellow,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Recovered'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${snapshot.data!.recovered}')
                              ],
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Deaths'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${snapshot.data!.deaths}')
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Active Cases'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${snapshot.data!.active}')
                              ],
                            ),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            color: Colors.orange,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Affected Countries'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('${snapshot.data!.affectedCountries}')
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
