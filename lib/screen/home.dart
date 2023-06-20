import 'package:flutter/material.dart';
import 'package:login_regist/data/details.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/screen/quiz.dart';
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
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Pelajaran",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Container(
                            child: const Icon(
                              Icons.menu_book,
                              size: 40,
                            ),
                          ),
                          const Spacer(
                            flex: 10,
                          ),
                          Container(
                            height: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text("13",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: const Text("Selesai"),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Container(
                            height: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text("30",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: const Text("Belum Selesai"),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Container(
                            height: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text("43",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: const Text("Total"),
                                ),
                              ],
                            ),
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
                    
                        ))
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
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Quiz",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Spacer(
                            flex: 1,
                          ),
                          Container(
                            child: const Icon(
                              Icons.quiz_outlined,
                              size: 40,
                            ),
                          ),
                          const Spacer(
                            flex: 10,
                          ),
                          Container(
                            height: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text("25",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: const Text("Pertanyaan"),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Container(
                            height: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text("Mudah",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: const Text("Kesulitan"),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                          Container(
                            height: 40,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: const Text("80 %",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: const Text("Untuk Lolos"),
                                ),
                              ],
                            ),
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
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Video",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
