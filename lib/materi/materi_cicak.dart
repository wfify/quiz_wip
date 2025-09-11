import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MateriCicak extends StatelessWidget {
  final Map<String, String> data;
  const MateriCicak({super.key, required this.data});

  final List<Map<String, String>> materi = const [
    {
      "judul": "Kemampuan Regenerasi",
      "isi": "Cicak dapat memutuskan ekornya untuk mengelabui musuh dan menumbuhkannya kembali."
    },
    {
      "judul": "Sistem Pernapasan",
      "isi": "Cicak bernapas dengan paru-paru."
    },
    {
      "judul": "Habitat",
      "isi": "Cicak biasanya hidup di dinding rumah untuk mencari serangga kecil."
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
            child: data['gambar'] != null && data['gambar']!.isNotEmpty
                ? SvgPicture.asset(
              data['gambar']!,
              height: 180,
            )
                : const Icon(Icons.image_not_supported, size: 120),
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
