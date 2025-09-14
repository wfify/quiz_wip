import 'package:flutter/material.dart';

class MateriAyam extends StatefulWidget {
  final Map<String, String> data;
  const MateriAyam({super.key, required this.data});

  @override
  State<MateriAyam> createState() => _MateriAyamState();
}

class _MateriAyamState extends State<MateriAyam> {
  String? selectedImage;
  int? expandedIndex;

  // Daftar materi ayam
  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Terdapat mata, paruh, dan jengger.",
      "gambar": "assets/images/ayam_kepala.png"
    },
    {
      "judul": "Paruh",
      "isi": "Untuk mematuk makanan.",
      "gambar": "assets/images/ayam_paruh.png"
    },
    {
      "judul": "Jengger",
      "isi": "Tonjolan merah di kepala, sebagai ciri khas ayam.",
      "gambar": "assets/images/ayam_jengger.png"
    },
    {
      "judul": "Sayap",
      "isi": "Membantu keseimbangan dan untuk terbang pendek.",
      "gambar": "assets/images/ayam_sayap.png"
    },
    {
      "judul": "Kaki dan Cakar",
      "isi": "Untuk berjalan dan mengais tanah mencari makanan.",
      "gambar": "assets/images/ayam_ceker.png"
    },
    {
      "judul": "Bulu",
      "isi": "Menutupi tubuh agar tetap hangat.",
      "gambar": "assets/images/ayam_bulu.png"
    },
    {
      "judul": "Ekor",
      "isi": "Membantu menjaga keseimbangan.",
      "gambar": "assets/images/ayam_ekor.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedImage = widget.data['gambar']; // gambar default (ayam utuh)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Materi ${widget.data['nama']}")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Hero(
            tag: widget.data['nama']!,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                selectedImage!,
                key: ValueKey(selectedImage),
                height: 200,
              ),
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
                    key: ValueKey(index == expandedIndex),
                    title: Text(item['judul']!),
                    initiallyExpanded: expandedIndex == index,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        if (expanded) {
                          expandedIndex = index;
                          selectedImage = item['gambar'];
                        } else if (expandedIndex == index) {
                          expandedIndex = null;
                          selectedImage = widget.data['gambar']; // balik default
                        }
                      });
                    },
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
