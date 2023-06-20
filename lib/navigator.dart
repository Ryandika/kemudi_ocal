// import 'package:flutter/material.dart';
// import 'package:login_regist/screen/find.dart';
// import 'package:login_regist/screen/home.dart';
// import 'package:login_regist/screen/lesson.dart';
// import 'package:login_regist/screen/profile.dart';


// class NavigatorMain extends StatefulWidget {
//   // final User user;
  
//   const NavigatorMain({super.key});
//   // NavigatorMain(this.user);

//   @override
//   State<NavigatorMain> createState() => _NavigatorMainState();
// }

// class _NavigatorMainState extends State<NavigatorMain> {
  
//   int _selectedIndex = 0;
// final List<Widget> _screens = [
// const Home(),
// const LessonPage(),
// const FindPage(),
// const ProfilePage(),
// ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         selectedIconTheme: IconThemeData(color: Colors.amber, size: 30),
//         selectedItemColor: Colors.deepPurpleAccent,
//         selectedFontSize: 14,
//         selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
//         unselectedItemColor: Colors.black.withOpacity(0.30),
//         currentIndex: _selectedIndex,
//         onTap: (value) {
//           setState(() {
//             _selectedIndex = value;
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//         items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home), 
//           label: "Home"),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.menu_book), 
//           label: "Pelajaran"),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.gps_fixed_outlined), 
//           label: "Temukan"),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person_2_outlined), 
//           label: "Profil"),
//       ],
//       ),


//       // bottomNavigationBar: Container(
//       //   color: Colors.black,
//       //   child: Padding(
//       //     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
//       //     child: GNav(
//       //       backgroundColor: Colors.black,
//       //       color:  Colors.white,
//       //       activeColor: Colors.white,
//       //       tabBackgroundColor: Colors.grey.shade900,
//       //       gap: 8,
//       //       onTabChange: (i){
//       //         setState(() {
//       //           _selectedIndex = i;
//       //         });
//       //       },
//       //       padding: const EdgeInsets.all(16),
//       //       tabs: const [
//       //         GButton(
//       //           icon: Icons.home,
//       //           text: 'Beranda',
//       //         ),
//       //         GButton(
//       //           icon: Icon(CupertinoIcons.book),
//       //           text: 'Pelajaran',
//       //         ),
//       //         GButton(
//       //           icon: Icons.gps_fixed_outlined,
//       //           text: 'Temukan',
//       //         ),
//       //         GButton(
//       //           icon: Icons.person_2_outlined,
//       //           text: 'Profil',
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // ),
      
//     );
//   }
// }
