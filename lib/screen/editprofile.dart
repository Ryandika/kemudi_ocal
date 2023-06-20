import 'package:flutter/material.dart';
import 'package:login_regist/screen/tabs.dart';
import 'package:login_regist/screen/profile.dart';

// class EditProfileScreen extends StatelessWidget{
// const EditProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "setting ui",
//       home: EditProfile(),
//     );
//   }
// }

class EditProfileScreen extends StatefulWidget{
const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // actions: [
          //   IconButton(
          // icon: Icon(
          //   Icons.settings,
          //   color: Colors.green,
          //   ),
          //   onPressed: () {},
          //   ),
          // ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text("Edit Profil",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10)
                          )
                        ],
                        shape: BoxShape.circle,
                        
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit, 
                          color: Colors.white,
                        ),
                      )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildtextfield("Nama Depan", "Farrel"),
              buildtextfield("Nama Belakang", "Revi"),
              buildtextfield("Umur", "21"),

              ElevatedButton(
                onPressed: (){}, 
                child: const Text("Simpan")
              )

              // const SizedBox(height: 35,),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     onPressed: () {}, 
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.yellow,
              //       side: BorderSide.none,
              //       shape: const StadiumBorder()
              //     ),
              //     child: const Text(
              //       "Simpan",
              //       style: TextStyle(color: Colors.black),
              //     )),
              // ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 50),
                    
              //       child: OutlinedButton(
              //       onPressed: () {}, 
              //       child: Text("Batal",
              //       style: TextStyle(
              //         fontSize: 14,
              //         letterSpacing: 2.2,
              //         color: Colors.black),)
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildtextfield(String labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: labelText,
                  //floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: placeholder,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )
                ),
              ),
    );
  }
}