import 'package:flutter/material.dart';
import 'package:login_regist/models/sign.dart';
import 'package:login_regist/widgets/drag_widget.dart';

class CardsStackWidget extends StatefulWidget {
  const CardsStackWidget({Key? key}) : super(key: key);

  @override
  State<CardsStackWidget> createState() => _CardsStackWidgetState();
}

class _CardsStackWidgetState extends State<CardsStackWidget> {
  List<Sign> dragabbleItems = [
    const Sign(
        title: 'Panah Kiri',
        caption: 'Panah kiri mengharuskan pengguna jalan untuk membawa kendaraan mengikuti jalur ke arah kiri.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Kiri-1024x583.png'),
    const Sign(
        title: 'Panah Kanan',
        caption: 'Panah kanan mengharuskan pengguna jalan untuk mengendarai kendaraan ke arah kanan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Kanan-1024x583.png'),
    const Sign(
        title: 'Panah Belok Kiri',
        caption: 'Panah kanan mengharuskan pengguna jalan untuk mengendarai kendaraan ke arah kanan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Belok-Kiri-1024x583.png'),
    const Sign(
        title: 'Panah Belok Kanan',
        caption: 'Panah kanan mengharuskan pengguna jalan untuk mengendarai kendaraan ke arah kanan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Belok-Kanan-1024x583.png'),
    const Sign(
        title: 'Panah Atas',
        caption: 'Panah Atas merupakan rambu perintah yang mewajibkan pengendara untuk terus lurus dan rambu ini seringkali ditemukan di jalan searah atau jalan tol. Panah atas melarang para pengendara untuk berbelok atau melakukan balik arah.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Atas-1024x583.png'),
    const Sign(
        title: 'Panah Bawah Serong Kiri',
        caption: 'Panah bawah serong kiri mengharuskan pengendara untuk mengikuti jalur atau lajur kiri.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Bawah-Serong-Kiri-1024x583.png'),
    const Sign(
        title: 'Panah bawah serong kanan',
        caption: 'Panah bawah serong kanan mengharuskan para pengendara untuk mengikuti jalur ke arah kanan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Bawah-Serong-Kanan-1024x583.png'),
    const Sign(
        title: 'Stop',
        caption: 'Ini adalah rambu lalu lintas stop. Apabila Anda melihat tanda stop dengan latar yang berwarna merah, maka dilarang untuk melaju atau berkendara pada suatu jalur. Pengendara diharuskan untuk berhenti sejenak atau berhenti sampai kondisi lebih aman dan hal ini dilakukan untuk menghindarkan adanya konflik dalam lalu lintas.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Stop-1024x583.png'),
    const Sign(
        title: 'Strip',
        caption: 'Strip adalah rambu yang melarang pengguna jalan untuk masuk ke suatu tempat dan larangan ini berlaku buat pengendara atau pejalan kaki. Rambu lalu lintas dilarang masuk ini bisa dilanggar oleh pihak yang memiliki pengecualian.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Strip-1024x583.png'),
    const Sign(
        title: 'Angka kecepatan minimum dalam kilometer (km)',
        caption: 'Apabila melihat rambu perintah yang menunjukkan angka kecepatan minimum, maka pengguna jalan tidak boleh membawa kendaraan di bawah atau melebihi batas kecepatannya. Dengan melihat rambu ini, maka pengendara bisa mengetahui kecepatan terbaik dan aman dalam berkendara.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Angka-kecepatan-minimum-dalam-kilometer-1024x583.png'),
    const Sign(
        title: 'S Dicoret',
        caption: 'Tanda S biasanya menandakan stop atau berhenti, sedangkan tanda “S” dicoret menandakan jangan berhenti. Apabila anda melihat rambu ini, maka anda tidak boleh berhenti sejenak atau parkir dan apabila anda melanggar, maka anda akan dikenakan tilang sesuai dengan peraturan undang-undang yang berlaku di Indonesia.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/S-Dicoret-1024x583.png'),
    const Sign(
        title: 'P Dicoret',
        caption: 'Ini adalah rambu lalu lintas dilarang parkir. Apabila anda melihat rambu P dicoret, maka anda tidak boleh parkir di area tersebut dan tanda ini biasanya diterapkan untuk menghindarkan kemacetan akibat adanya parkir liar. Tanda ini juga sering ditemukan di area perkotaan, agar menghindarkan angkutan umum parkir dan mencari penumpang dalam waktu lama.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/P-Dicoret-1024x583.png'),
    const Sign(
        title: 'Putar Balik Dicoret',
        caption: 'Putar balik dicoret adalah rambu yang sering ditemukan di area persimpangan atau di jalan satu arah dan rambu ini melarang pengendara untuk melakukan putar balik. Rambu ini biasanya diterapkan untuk menghindarkan kemacetan di area persimpangan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Putar-Balik-Dicoret-1024x583.png'),
    const Sign(
        title: 'Belok Kiri Dicoret',
        caption: 'Belok kiri dicoret kebanyakan ditemukan di jalan satu arah, meskipun ada juga yang dipasangkan di area persimpangan. Larangan ini berlaku untuk pengendara motor atau mobil dan pelarangan belok kiri biasanya untuk menghindarkan kemacetan atau penumpukan kendaraan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Belok-Kiri-Dicoret-1024x583.png'),
    const Sign(
        title: 'Belok Kanan Dicoret',
        caption: 'Belok kanan dicoret tentu melarang para pengendara untuk berbelok ke arah kanan dan larangan ini biasanya menghindarkan adanya tabrakan antara pengendara di lajur kiri dengan kanan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Belok-Kanan-Dicoret-1024x583.png'),
    const Sign(
        title: 'Tiga panah melingkar',
        caption: 'Tiga panah melingkar merupakan rambu peringatan yang menandakan adanya persimpangan atau bundaran, sehingga pengendara harus berhati-hati dan mengurangi kecepatan berkendara.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Tiga-Panah-Melingkar-1024x583.png'),
    const Sign(
        title: 'Seru (!)',
        caption: 'Rambu peringatan rambu lalu lintas tanda seru biasanya memberikan kewaspadaan ke pengendara, agar lebih berhati-hati saat memasuki suatu jalur.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Tanda-Seru-1024x583.png'),
    const Sign(
        title: 'Plus (+)',
        caption: 'Apabila Anda menemukan rambu peringatan dengan tanda plus, maka akan menemukan persimpangan empat dan pengendara diharapkan memperlambat laju kendaraan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Tanda-Plus-1024x583.png'),
    const Sign(
        title: 'Plus Dihapus Bagian Kanan',
        caption: 'Tanda plus dihapus bagian kiri merupakan rambu yang menunjukkan adanya persimpangan tiga sisi dan salah salah satunya ke arah kanan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Plus-Dihapus-Bagian-Kanan-1024x583.png'),
    const Sign(
        title: 'Plus Dihapus Bagian Kiri',
        caption: 'Apabila Anda menemukan rambu ini, maka akan menemukan persimpangan dengan tiga sisi dan ada satu arah yang ke kiri.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Plus-Dihapus-Bagian-Kiri-1024x583.png'),
    const Sign(
        title: 'Panah Atas dan Bawah',
        caption: 'Panas atas dan bawah menandakan bahwa jalur yang bisa dilalui yaitu lajur atas dengan bawah.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Panah-Atas-dan-Bawah-1024x583.png'),
    const Sign(
        title: 'Arah Kota di Persimpangan',
        caption: 'Tanda arah kota di persimpangan biasanya menandakan petunjuk jurusan ke sebuah lokasi dan petunjuk ini biasanya ditemukan di berbagai persimpangan jalan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Arah-Kota-di-Persimpangan-1024x583.png'),
    const Sign(
        title: 'Arah Kota di Persimpangan',
        caption: 'Tanda arah kota biasanya menjadi petunjuk arah untuk pengendara, agar pengendara mengambil lajur yang tepat saat ingin datang ke sebuah daerah.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Arah-Kota-1024x583.png'),
    const Sign(
        title: 'Jalan Tol',
        caption: 'Tanda jalan tol merupakan petunjuk untuk pengendara, apabila sebentar lagi akan memasuki area jalan tol.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Jalan-Tol-1024x583.png'),
    const Sign(
        title: 'Rumah Sakit',
        caption: 'Tanda pom bensin menjadi petunjuk yang tepat untuk pengendara yang ingin mengisi bahan bakar kendaraannya.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Rumah-Sakit-1024x583.png'),
    const Sign(
        title: 'POM Bensin',
        caption: 'Tanda pom bensin menjadi petunjuk yang tepat untuk pengendara yang ingin mengisi bahan bakar kendaraannya.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Pom-Bensin-1024x583.png'),
    const Sign(
        title: 'Tempat Tidur',
        caption: 'Apabila Anda menemukan tanda ranjang atau tempat tidur, maka akan segera menemukan sebuah hotel atau penginapan.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Tempat-Tidur-1024x583.png'),
    const Sign(
        title: 'Orang Berjalan',
        caption: 'Ketika Anda menemukan tanda orang berjalan kaki, maka menunjukkan bahwa area tersebut untuk para pejalan kaki.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Orang-Berjalan-1024x583.png'),
    const Sign(
        title: 'Bus',
        caption: 'Tanda bus biasanya menandakan tempat berhentinya bus atau tempat bus mencari penumpang.',
        imageLink: 'https://wuling.id/wp-content/uploads/2021/02/Blues-1024x583.png'),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) => Stack(

              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: List.generate(dragabbleItems.length, (index) {
                return DragWidget(
                  sign: dragabbleItems[index],
                  index: index,
                  swipeNotifier: swipeNotifier,
                );
              }),
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                dragabbleItems.removeAt(index);
              });
            },
          ),
        ),
        Positioned(
          right: 0,
          child: DragTarget<int>(
            builder: (
              BuildContext context,
              List<dynamic> accepted,
              List<dynamic> rejected,
            ) {
              return IgnorePointer(
                child: Container(
                  height: 700.0,
                  width: 80.0,
                  color: Colors.transparent,
                ),
              );
            },
            onAccept: (int index) {
              setState(() {
                dragabbleItems.removeAt(index);
              });
            },
          ),
        ),
      ],
    );
  }
}