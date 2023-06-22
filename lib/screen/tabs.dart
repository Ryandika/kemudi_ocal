import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_regist/screen/find.dart';
import 'package:login_regist/screen/home.dart';
import 'package:login_regist/screen/lesson.dart';
import 'package:login_regist/screen/profile.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  GoogleSignInAccount? _currentUser;

  //  @override
 int _selectedIndex = 0;

final List<Widget> _screens = [
const HomeScreen(),
const LessonScreen(),
 FindPage(),
const ProfileScreen(),
];

  //log out function
  void userOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: userOut, icon: const Icon(Icons.logout)),
      //   ],
      // ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home), 
          label: "Beranda"),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book), 
          label: "Pelajaran"),
        BottomNavigationBarItem(
          icon: Icon(Icons.gps_fixed_outlined), 
          label: "Temukan"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined), 
          label: "Profil"),
      ],
      ),
     /* ListView(children: <Widget>[
        Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            //you logged in as
            Center(
              child: Text(
                "You are Logged in! as " + user.email!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            //isi homepage
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        child: const Text(
                          "Hello Dimika",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: const Text(
                          "Selamat datang kembali!",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox( width: 200),
                  const SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(
                      value: 0.4,
                      strokeWidth: 5,
                      color: Colors.white, //<-- SEE HERE
                      backgroundColor: Colors.black, //<-- SEE HERE
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            child: const Text("Pelajaran"),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              // child: Text("Lanjutkan pelajaran yang tertinggal"),
                              ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text("13",
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, right: 10),
                                    child: Text("Selesai"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text("30",
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5, right: 10),
                                    child: Text("Belum Selesai"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text("43",
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    child: Text("Total"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //       // onPressed: () {
                  //       //   Navigator.push(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //         builder: (context) => const LessonPage()),
                  //       //   );
                  //       // },
                  //       child: Text("Lanjutkan"),
                  //     )
                  // ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(5))),
              // child: Column(
              //   children: [
              //     // const SizedBox(height: 100),
              //   ],
              // )
            ),
            

            // <--googlesiginaccount-->

            // Container(
            //   child: ListTile(
            //     leading: GoogleUserCircleAvatar(identity: _currentUser,
            //   ),
            // ),
            // )
          ],
        ),
      ]),
      */
    );
  }
}
