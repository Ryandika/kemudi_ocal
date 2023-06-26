import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/screen/about_us.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //current user
    final currentUser = FirebaseAuth.instance.currentUser!;

    //all users
    final userCollection = FirebaseFirestore.instance.collection("Users");

    //edit field
    Future<void> editField(String field) async {
      String newValue = "";
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            "Edit $field",
            style: const TextStyle(color: Colors.white),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "masukan $field baru",
              hintStyle: const TextStyle(color: Colors.white30),
            ),
            onChanged: (value) {
              newValue = value;
            },
          ),
          actions: [
            TextButton(
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text(
                'Simpan',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).pop(newValue),
            )
          ],
        ),
      );

      //update user data in firestore
      if (newValue.trim().isNotEmpty) {
        await userCollection.doc(currentUser.email).update({field: newValue});
      }
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Profil"),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const EditProfileScreen()),
          //       );
          //     },
          //     icon: const Icon(Icons.edit),
          //   )
          // ],
        ),
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
                padding: const EdgeInsets.all(10),
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        userData['username'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Umur: ${userData['age']}',
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  //username
                  const SizedBox(height: 35),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   // color: Colors.blue
                      // )
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Username:',
                                  style:
                                      TextStyle(color: Colors.blue.shade800)),
                              IconButton(
                                  onPressed: () => editField('username'),
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue.shade800,
                                  )),
                            ],
                          ),
                          Text(userData['username']),
                        ]),
                  ),

                  //first name
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   // color: Colors.blue
                      // )
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nama Depan:',
                                  style:
                                      TextStyle(color: Colors.blue.shade800)),
                              IconButton(
                                  onPressed: () => editField('nama depan'),
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue.shade800,
                                  )),
                            ],
                          ),
                          Text(userData['nama depan']),
                        ]),
                  ),

                  //last name
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(
                      //   // color: Colors.blue
                      // )
                    ),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    margin:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nama Belakang:',
                                  style:
                                      TextStyle(color: Colors.blue.shade800)),
                              IconButton(
                                  onPressed: () => editField('nama belakang'),
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue.shade800,
                                  )),
                            ],
                          ),
                          Text(userData['nama belakang']),
                        ]),
                  ),

                  Card(
                    elevation: 4,
                    shadowColor: Colors.black12,
                    child: ListTile(
                      leading: Icon(
                        Icons.people,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      title: const Text('Tentang Kami'),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUsScreen()),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 4,
                    shadowColor: Colors.black12,
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      title: const Text('Keluar'),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.black,
                            title: const Text("Apakah anda yakin ingin keluar?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            actions: [
                              TextButton(
                                child: const Text(
                                  'Batal',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              TextButton(
                                  child: const Text(
                                    'Keluar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.pop(context);
                                  })
                            ],
                          ),
                        );
                      },
                    ),
                  )
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
        ));
  }
}
