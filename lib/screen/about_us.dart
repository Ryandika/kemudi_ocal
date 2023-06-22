import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:login_regist/main.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Deskripsi aplikasi',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Aplikasi Kemudi merupakan aplikasi pembelajaran mengemudi yang menyediakan teori-teori mengemudi sesuai dengan aturan lalu lintas yang ada di Indonesia. Aplikasi ini diharapkan membantu user memiliki pemahaman dasar yang dapat digunakan ketika latihan praktek mengemudi di lapangan.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.normal,
                ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Manfaat',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Membantu pemerintah dalam menyediakan media\nbelajar mengemudi yang taat dengan aturan lalu\nlintas di Indonesia.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2, left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Mempermudah masyarakat untuk mendapatkan\ninformasi mengenai tata cara mengemudi yang\nbaik dan benar disertai dengan video pembelajaran',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Tim',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Kautsar Ryandika Wibowo - 2301878233',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Muhammad Farrel Revikasha - 2301885970',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Gian Avila - 2301891222',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            'Kredit Kepada Pemilik Kanal Youtube',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'jemi nor jaman',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Ss march family',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Pandu Dewanata',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.circle,
                  size: 8,
                ),
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                'Kursus Stir AQUARIUS',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          Text(
            'Atas video yang digunakan sebagai media pembelajaran pada aplikasi Kemudi',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ]),
      ),
    );
  }
}
