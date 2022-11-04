import 'package:flutter/material.dart';
import 'Modalclass.dart';
import 'helperclass.dart';


class Covid_Page extends StatefulWidget {
  const Covid_Page({Key? key}) : super(key: key);

  @override
  State<Covid_Page> createState() => _Covid_PageState();
}

class _Covid_PageState extends State<Covid_Page> {
  late Future<List<Detail?>?> fetchCovidCases;

  @override
  initState() {
    super.initState();
    fetchCovidCases = APIHelper.apiHelper.fetchCovid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Covid case',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          FutureBuilder(
            future: fetchCovidCases,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                List<Detail> data = snapshot.data as List<Detail>;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      color: Colors.amber,
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: data
                            .map(
                              (e) =>
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        height: 50,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                          Border.all(color: Colors.black),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          e.state,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.black,
                                        child: Text(
                                          e.cases.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                        )
                            .toList(),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ));
              }
            },
          ),
        ],
      ),
    );
  }
}
