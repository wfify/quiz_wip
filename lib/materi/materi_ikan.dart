import 'package:flutter/material.dart';

class MateriIkan extends StatefulWidget {
  final Map<String, String> data;
  const MateriIkan({super.key, required this.data});

  @override
  State<MateriIkan> createState() => _MateriIkanState();
}

class _MateriIkanState extends State<MateriIkan> {
  String? selectedImage; // gambar yang aktif
  int? expandedIndex; // index yang sedang terbuka

  // Daftar materi + gambar highlight
  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Terdapat mata, mulut, dan insang.",
      "gambar": "assets/images/ikan_kepala.png"
    },
    {
      "judul": "Insang",
      "isi": "Untuk bernapas di dalam air, terletak di sisi kepala.",
      "gambar": "assets/images/ikan.png" // default ikan utuh
    },
    {
      "judul": "Sisik",
      "isi": "Menutupi tubuh dan melindungi ikan.",
      "gambar": "assets/images/ikan_badan.png"
    },
    {
      "judul": "Sirip",
      "isi":
      "Terdiri dari sirip dada, sirip punggung, dan sirip perut, berfungsi untuk berenang dan menjaga keseimbangan.",
      "gambar": "assets/images/ikan_sirip.png"
    },
    {
      "judul": "Ekor",
      "isi": "Mendorong tubuh agar ikan bisa bergerak maju di air.",
      "gambar": "assets/images/ikan_ekor.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedImage = widget.data['gambar']; // gambar default dari data
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
              duration: const Duration(milliseconds: 500), // transisi smooth
              child: Image.asset(
                selectedImage!,
                key: ValueKey(selectedImage),
                height: 180,
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
                    key: ValueKey(index == expandedIndex), // penting! reset state
                    title: Text(item['judul']!),
                    initiallyExpanded: expandedIndex == index,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        if (expanded) {
                          expandedIndex = index; // buka hanya yang ini
                          selectedImage = item['gambar'];
                        } else if (expandedIndex == index) {
                          expandedIndex = null; // kalau ditutup manual
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
