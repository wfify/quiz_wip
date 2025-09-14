import 'package:flutter/material.dart';

class MateriGajah extends StatefulWidget {
  final Map<String, String> data;
  const MateriGajah({super.key, required this.data});

  @override
  State<MateriGajah> createState() => _MateriGajahState();
}

class _MateriGajahState extends State<MateriGajah> {
  String? selectedImage;
  int? expandedIndex;

  // Daftar materi gajah
  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Terdapat mata, telinga, belalai, dan gading.",
      "gambar": "assets/images/gajah_kepala.png"
    },
    {
      "judul": "Belalai",
      "isi": "Panjang dan lentur, digunakan untuk mengambil makanan, minum, dan menyemprot air.",
      "gambar": "assets/images/gajah_belalai.png"
    },
    {
      "judul": "Telinga besar",
      "isi": "Untuk mendengar dan mengatur suhu tubuh.",
      "gambar": "assets/images/gajah_telinga.png"
    },
    {
      "judul": "Gading",
      "isi": "Untuk melindungi diri dan menggali tanah.",
      "gambar": "assets/images/gajah_gading.png"
    },
    {
      "judul": "Kaki besar",
      "isi": "Menopang tubuh yang berat.",
      "gambar": "assets/images/gajah_kaki.png"
    },
    {
      "judul": "Ekor",
      "isi": "Digunakan untuk mengusir lalat atau serangga.",
      "gambar": "assets/images/gajah_ekor.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedImage = widget.data['gambar']; // gambar default (gajah utuh)
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
