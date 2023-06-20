import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/models/lesson_details.dart';
import 'package:login_regist/screen/editprofile.dart';
import 'package:login_regist/screen/lesson_detail.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  void userOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Profil"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileScreen()),
                    );
            },
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
              ),
              SizedBox(height: 10),
              Text(
                "Farrel Revi",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("21 Tahun")
            ],
          ),
          // const SizedBox(height: 25),
          // Row(
          //   children: const[
          //     Padding(
          //       padding: EdgeInsets.only(right: 4),
          //       child: Text("Lengkapi Profilmu",
          //       style: TextStyle(
          //         fontWeight: FontWeight.bold,
          //       ),
          //       ),
          //     ),
          //     Text("(3/4)",
          //     style: TextStyle(
          //       color: Colors.red,
          //     ),
          //     )
          //   ],
          // ),
          // SizedBox(height: 10),
          // Row(
          //   children: List.generate(4, (index) {
          //     return Expanded(
          //       child: Container(
          //         height: 7,
          //         margin: EdgeInsets.only(right: index == 3 ? 0 : 5),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: index == 3 ? Colors.red : Colors.green,
          //         ),
          //       ),
          //     );
          //   }),

          // ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileContinueCardd[index];
                return SizedBox(
                  width: 140,
                  child: Card(
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(
                            card.icon,
                            size: 25,
                          ),
                          SizedBox(height: 10),
                          Text(
                            card.title,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          Text(card.nilai, style: TextStyle(fontSize: 16),)
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileContinueCardd.length,
            ),
          ),
          const SizedBox(height: 35),
          ...List.generate(
            customlistTile.length,
            (index) {
              final tile = customlistTile[index];
              return Card(
                elevation: 4,
                shadowColor: Colors.black12,
                child: ListTile(
                  leading: Icon(tile.icon, color: colorScheme.onPrimaryContainer,),
                  title: Text(tile.title),
                  trailing: Icon(Icons.chevron_right, color: colorScheme.onPrimaryContainer,),
                  onTap: userOut,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ProfileContinueCard {
  final String title;
  final String nilai;
  final IconData icon;
  ProfileContinueCard({
    required this.title,
    required this.nilai,
    required this.icon,
  });
}

List<ProfileContinueCard> profileContinueCardd = [
  ProfileContinueCard(
    title: "Jumlah Skor",
    icon: Icons.score,
    nilai: "80",
  ),
  ProfileContinueCard(
    title: "Jumlah Penghargaan",
    icon: Icons.archive,
    nilai: "20",
  ),
  ProfileContinueCard(
    title: "Jumlah Kuis",
    icon: Icons.task,
    nilai: "30",
  ),
];


class CustomListTile {
  final IconData icon;
  final String title;
  
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customlistTile = [
  // CustomListTile(
  // title: "Ganti Password",
  // icon: Icons.password,
  // ),
  CustomListTile(
    title: "Tentang Kami",
    icon: Icons.people,
  ),
  CustomListTile(
    title: "Kebijakan Aplikasi",
    icon: Icons.privacy_tip,
  ),
  CustomListTile(
    title: "FAQ",
    icon: Icons.question_answer,
  ),
  CustomListTile(
    title: "Keluar",
    icon: Icons.logout,
    
  ),
];
