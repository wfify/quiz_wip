import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // package untuk audio

class MateriAyam extends StatefulWidget {
  final Map<String, String> data;
  const MateriAyam({super.key, required this.data});

  @override
  State<MateriAyam> createState() => _MateriAyamState();
}

class _MateriAyamState extends State<MateriAyam> {
  String? selectedImage; // gambar yang aktif
  int? expandedIndex; // index yang sedang terbuka
  final AudioPlayer audioPlayer = AudioPlayer();

  // Daftar materi ayam
  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Ada mata, paruh, dan jengger (tonjolan merah di atas kepala).",
      "gambar": "assets/images/ayam_kepala.png"
    },
    {
      "judul": "Paruh",
      "isi": "Dipakai untuk mematuk makanan, misalnya biji-bijian atau nasi.",
      "gambar": "assets/images/ayam_paruh.png"
    },
    {
      "judul": "Jengger",
      "isi": "Tanda khas ayam, bentuknya merah dan terlihat di atas kepala.",
      "gambar": "assets/images/ayam_jengger.png"
    },
    {
      "judul": "Sayap",
      "isi": "Untuk menjaga keseimbangan tubuh dan membantu ayam terbang sebentar.",
      "gambar": "assets/images/ayam_sayap.png"
    },
    {
      "judul": "Kaki dan Cakar",
      "isi": "Dipakai untuk berjalan dan mengais tanah mencari makanan.",
      "gambar": "assets/images/ayam_ceker.png"
    },
    {
      "judul": "Bulu",
      "isi": "Menutupi tubuh agar tetap hangat.",
      "gambar": "assets/images/ayam_bulu.png"
    },
    {
      "judul": "Ekor",
      "isi": "Membantu ayam menjaga keseimbangan.",
      "gambar": "assets/images/ayam_ekor.png"
    },
    {
      "judul": "Tambahan",
      "isi":
      "Ayam ada dua jenis, yaitu ayam jantan (jago) yang suka berkokok, dan ayam betina yang bisa bertelur. "
          "Ayam suka makan jagung, padi, atau cacing kecil.",
      "gambar": "assets/images/ayam.png"
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
    // memutar file audio dari assets, misal 'assets/audio/ayam_kokok.mp3'
    await audioPlayer.play(AssetSource('audio/ayam_kokok.mp3'));
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
                    child: Image.asset(
                      selectedImage!,
                      key: ValueKey(selectedImage),
                      height: 180,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.volume_up, size: 30, color: Colors.orange),
                  onPressed: playSound,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Ayam adalah hewan yang sering dipelihara di rumah. "
                  "Ayam bisa bertelur dan juga berkokok.",
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

                  if (expandedIndex == index) {
                    return SizedBox(
                      width: item['judul'] == "Tambahan"
                          ? MediaQuery.of(context).size.width - 32
                          : MediaQuery.of(context).size.width - 32,
                      child: Card(
                        color: Colors.blue.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              title: Text(
                                item['judul']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
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
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  return SizedBox(
                    width: item['judul'] == "Tambahan"
                        ? MediaQuery.of(context).size.width - 32
                        : buttonWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          expandedIndex = index;
                          selectedImage = item['gambar'];
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
