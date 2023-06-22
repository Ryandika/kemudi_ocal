import 'package:flutter/material.dart';
import 'package:login_regist/data/details.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/screen/quiz.dart';
import 'package:login_regist/screen/traffic_sign.dart';
import 'lesson.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hello",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: const Text(
                            "Selamat datang kembali!",
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox( width: 200),
                    // const SizedBox(
                    //   height: 50.0,
                    //   width: 50.0,
                    //   child: CircularProgressIndicator(
                    //     value: 0.4,
                    //     strokeWidth: 5,
                    //     color: Colors.white, //<-- SEE HERE
                    //     backgroundColor: Colors.black, //<-- SEE HERE
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Pelajaran",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.menu_book,
                            size: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:12.0),
                            child: Text(
                                "Lanjutkan pelajaran Anda sehingga\ndapat mengemudikan mobil",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LessonScreen()),
                          );
                        },
                        child: const Text("Lanjutkan"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Quiz",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.quiz_outlined,
                            size: 60,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:12.0),
                            child: Text(
                                "Ketahui seberapa bagus pemahaman\nAnda tentang mengemudi",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QuizPage()),
                          );
                        },
                        child: const Text("Mulai"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Rambu Lalu Lintas",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TrafficSignScreen()),
                          );
                        },
                        child: const Text("Lihat"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
