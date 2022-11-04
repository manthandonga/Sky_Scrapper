import 'dart:async';
import 'package:flutter/material.dart';
import 'helperclass.dart';
import 'modelclass.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  late Future<Detail?> fecthBioData;
  TextStyle myTextStyle = const TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {});
    });
    fecthBioData = APIHelper.apiHelper.fetchBioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Resume',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: fecthBioData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            Detail data = snapshot.data as Detail;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(data.img),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${data.fName} ${data.lName}",
                        style: myTextStyle,
                      ),
                      const SizedBox(height: 7),
                      Text(
                        data.gender,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.account_circle_sharp,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Age : ${data.age}",
                            style: myTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            data.phoneNumber,
                            style: myTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 30,
                            child: Text(
                              data.emailId,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.date_range,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            data.dob.split("T")[0],
                            style: myTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "${data.city},\n${data.state}, \n${data.country}",
                            style: myTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
                child: Stack(
              alignment: Alignment.center,
              children: const [
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                ),
                CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ],
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {fecthBioData = APIHelper.apiHelper.fetchBioData();});
        },
      ),
    );
  }
}
