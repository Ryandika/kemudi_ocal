import 'package:flutter/material.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/widgets/carousel_sign%20copy%202.dart';
import 'package:login_regist/widgets/carousel_sign%20copy%203.dart';
import 'package:login_regist/widgets/carousel_sign%20copy.dart';
import 'package:login_regist/widgets/carousel_sign.dart';

class TrafficSignScreen extends StatelessWidget {
  const TrafficSignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rambu Lalu Lintas'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignCarousel()),
              );
            },
            child: ListTile(
              tileColor: colorScheme.primaryContainer,
              trailing: const Icon(Icons.chevron_right),
              title: Text('Rambu Peringatan', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
            ),
            
          ),
          const Divider(
            height: 0,
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignCarousel1()),
              );
            },
            child: ListTile(
              tileColor: colorScheme.primaryContainer,
              trailing: const Icon(Icons.chevron_right),
              title: Text('Rambu Larangan', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
            ),
          ),
          const Divider(
            height: 0,
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignCarousel2()),
              );
            },
            child: ListTile(
              tileColor: colorScheme.primaryContainer,
              trailing: const Icon(Icons.chevron_right),
              title: Text('Rambu Perintah', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
            ),
          ),
          const Divider(
            height: 0,
            thickness: 2,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SignCarousel3()),
              );
            },
            child: ListTile(
              tileColor: colorScheme.primaryContainer,
              trailing: const Icon(Icons.chevron_right),
              title: Text('Rambu Petunjuk', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                )),
            ),
          ),
          const Divider(
            height: 0,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
