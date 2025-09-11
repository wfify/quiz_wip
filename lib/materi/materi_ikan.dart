import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MateriIkan extends StatelessWidget {
  final Map<String, String> data;
  const MateriIkan({super.key, required this.data});

  final List<Map<String, String>> materi = const [
    {
      "judul": "Sistem Pernapasan",
      "isi": "Ikan bernapas dengan insang yang menyaring oksigen dari air."
    },
    {
      "judul": "Sistem Pencernaan",
      "isi": "Ikan menelan makanan langsung, lalu dicerna di lambung dan usus."
    },
    {
      "judul": "Sistem Peredaran Darah",
      "isi": "Ikan memiliki jantung dua ruang yang memompa darah ke insang dan seluruh tubuh."
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
