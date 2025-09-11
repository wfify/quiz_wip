import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MateriAyam extends StatelessWidget {
  final Map<String, String> data;
  const MateriAyam({super.key, required this.data});

  final List<Map<String, String>> materi = const [
    {
      "judul": "Sistem Pernapasan",
      "isi": "Ayam bernapas menggunakan paru-paru dan kantung udara yang membantu pertukaran oksigen."
    },
    {
      "judul": "Sistem Pencernaan",
      "isi": "Makanan masuk melalui paruh, kemudian ke tembolok, lambung, dan usus untuk dicerna."
    },
    {
      "judul": "Sistem Peredaran Darah",
      "isi": "Ayam memiliki jantung empat ruang yang memompa darah ke seluruh tubuh."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Materi ${data['nama']}")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Hero animasi gambar ayam
          Hero(
            tag: data['nama']!,
            child: SvgPicture.asset(
              data['gambar']!,
              height: 180,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: materi.length,
              itemBuilder: (context, index) {
                final item = materi[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    title: Text(
                      item['judul']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(item['isi']!),
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
