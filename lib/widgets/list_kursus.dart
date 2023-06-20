import 'package:flutter/material.dart';


class ListKursus extends StatelessWidget {
  ListKursus({super.key});

  int selectedIndex = 0;
  final List<String> lokasi = [
    'Ar-Rahman - Jakarta Timur',
    'Ar-Rahman - Jakarta Barat',
    'Ar-Rahman - Jakarta Pusat',
    'Persemija - Jakarta Selatan',
    'Persemija - Jakarta Utara',
    'Persemija - Depok',
    'Persemija - Bogor',
    'Persemija - Tangerang',
    'Persemija - Bekasi',
    'Asri - Pasar Rebo',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
            child: Text("Pilih Lokasi Kursus Mengemudi Terdekat!"),
          ),
          Row(
            children: [
              Container(
                width: 345,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Cari"), Icon(Icons.search_rounded)],
                    ),
                  ),
                ),
              ),
              const Icon(Icons.sort)
            ],
          ),
          Container(
          height: 450,
          child: ListView.builder(
            itemCount: lokasi.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Lokasi",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      alignment: Alignment.topLeft,
                      child: Text(
                        lokasi[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          ),
          
        ],
      ),
    );
  }
}
