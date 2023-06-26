import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/screen/quiz.dart';
import 'package:login_regist/screen/traffic_sign.dart';
import 'lesson.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //curremt user
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          //get user data
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
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
                            Text(
                              "Halo ${userData['nama depan']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16),
                              child: const Text(
                                "Selamat datang!",
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
                    padding: const EdgeInsets.all(10.0),
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
                                size: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                      "Lanjutkan pelajaran Anda sehingga dapat mengemudikan mobil",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
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
                                    builder: (context) =>
                                        const LessonScreen()),
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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Kuis",
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
                                size: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                      "Ketahui seberapa bagus pemahaman Anda tentang mengemudi",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
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
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "Rambu Lalu Lintas",
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
                                Icons.traffic_outlined,
                                size: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 12.0),
                                  child: Text(
                                      "Ketahui rambu lalu lintas yang ada!",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal)),
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
                                    builder: (context) => const TrafficSignScreen()),
                              );
                            },
                            child: const Text("LIhat"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
