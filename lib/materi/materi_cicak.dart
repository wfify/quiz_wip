import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MateriCicak extends StatefulWidget {
  final Map<String, String> data;
  const MateriCicak({super.key, required this.data});

  @override
  State<MateriCicak> createState() => _MateriCicakState();
}

class _MateriCicakState extends State<MateriCicak> {
  String? selectedImage;
  int? expandedIndex;
  final AudioPlayer audioPlayer = AudioPlayer();

  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Terdapat mata, mulut, dan hidung pada bagian kepala cicak.",
      "gambar": "assets/images/cicak_kepala.png"
    },
    {
      "judul": "Lidah",
      "isi":
      "Lidah cicak panjang dan lengket, digunakan untuk menangkap serangga kecil.",
      "gambar": "assets/images/cicak_lidah.png"
    },
    {
      "judul": "Kaki",
      "isi":
      "Cicak memiliki 4 kaki dengan bantalan perekat sehingga bisa menempel di dinding atau plafon.",
      "gambar": "assets/images/cicak_kaki.png"
    },
    {
      "judul": "Ekor",
      "isi":
      "Ekor cicak bisa putus (autotomi) untuk mengelabui musuh, dan dapat tumbuh kembali.",
      "gambar": "assets/images/cicak_ekor.png"
    },
    {
      "judul": "Kulit",
      "isi": "Kulit cicak berfungsi melindungi tubuh dari lingkungan luar.",
      "gambar": "assets/images/cicak.png"
    },
    {
      "judul": "Tambahan",
      "isi":
      "Cicak biasanya hidup di sekitar rumah dan membantu mengurangi populasi serangga."
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedImage = widget.data['gambar'];
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playSound() async {
    await audioPlayer.play(AssetSource('audio/cicak_suara.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;

    return Scaffold(
      appBar: AppBar(title: Text("Materi ${widget.data['nama']}")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Stack untuk gambar + tombol speaker
          Stack(
            children: [
              Center(
                child: Hero(
                  tag: widget.data['nama']!,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: widget.data['gambar'] != null
                        ? Image.asset(
                      selectedImage!,
                      key: ValueKey(selectedImage),
                      height: 180,
                    )
                        : const Icon(Icons.image_not_supported, size: 120),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.volume_up,
                      size: 30, color: Colors.orange),
                  onPressed: playSound,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Cicak adalah hewan reptil kecil yang sering hidup di sekitar rumah.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(materi.length, (index) {
                  final item = materi[index];

                  // Jika card dalam keadaan terbuka
                  if (expandedIndex == index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width - 32,
                      child: Card(
                        color: Colors.lightGreen.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              title: Text(
                                item['judul']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  setState(() {
                                    expandedIndex = null;
                                    selectedImage = widget.data['gambar'];
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(item['isi']!),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  // Tombol biasa
                  return SizedBox(
                    width: item['judul'] == "Tambahan"
                        ? MediaQuery.of(context).size.width - 32
                        : buttonWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          expandedIndex = index;
                          // ubah gambar sesuai bagian tubuh
                          selectedImage =
                              item['gambar'] ?? widget.data['gambar'];
                        });
                      },
                      child: Text(item['judul']!),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
