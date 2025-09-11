import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MateriGajah extends StatelessWidget {
  final Map<String, String> data;
  const MateriGajah({super.key, required this.data});

  final List<Map<String, String>> materi = const [
    {
      "judul": "Belalai",
      "isi": "Belalai gajah berfungsi sebagai alat pernapasan, pengambil makanan, dan komunikasi."
    },
    {
      "judul": "Sistem Pencernaan",
      "isi": "Gajah adalah herbivora, makan rumput, daun, dan buah yang dicerna dalam usus besar."
    },
    {
      "judul": "Sistem Peredaran Darah",
      "isi": "Gajah memiliki jantung besar empat ruang yang memompa darah ke seluruh tubuh."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Materi ${data['nama']}")),
      body: Column(
        children: [
          const SizedBox(height: 20),
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
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    title: Text(item['judul']!),
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
