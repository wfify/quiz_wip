import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MateriAyam extends StatefulWidget {
  final Map<String, String> data;
  const MateriAyam({super.key, required this.data});

  @override
  State<MateriAyam> createState() => _MateriAyamState();
}

class _MateriAyamState extends State<MateriAyam> {
  String? selectedImage;
  int? expandedIndex;
  final AudioPlayer audioPlayer = AudioPlayer();

  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Ada mata, paruh, dan jengger (tonjolan merah di atas kepala).",
      "gambar": "assets/images/ayam/ayam_kepala.png"
    },
    {
      "judul": "Paruh",
      "isi": "Dipakai untuk mematuk makanan, misalnya biji-bijian atau nasi.",
      "gambar": "assets/images/ayam/ayam_paruh.png"
    },
    {
      "judul": "Jengger",
      "isi": "Tanda khas ayam, bentuknya merah dan terlihat di atas kepala.",
      "gambar": "assets/images/ayam/ayam_jengger.png"
    },
    {
      "judul": "Sayap",
      "isi": "Untuk menjaga keseimbangan tubuh dan membantu ayam terbang sebentar.",
      "gambar": "assets/images/ayam/ayam_sayap.png"
    },
    {
      "judul": "Kaki dan Cakar",
      "isi": "Dipakai untuk berjalan dan mengais tanah mencari makanan.",
      "gambar": "assets/images/ayam/ayam_ceker.png"
    },
    {
      "judul": "Bulu",
      "isi": "Menutupi tubuh agar tetap hangat.",
      "gambar": "assets/images/ayam/ayam_bulu.png"
    },
    {
      "judul": "Ekor",
      "isi": "Membantu ayam menjaga keseimbangan.",
      "gambar": "assets/images/ayam/ayam_ekor.png"
    },
    {
      "judul": "Tambahan",
      "isi":
      "Ayam ada dua jenis, yaitu ayam jantan (jago) yang suka berkokok, dan ayam betina yang bisa bertelur. "
          "Ayam suka makan jagung, padi, atau cacing kecil.",
      "gambar": "assets/images/ayam/ayam.png"
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
    await audioPlayer.play(AssetSource('audio/ayam.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;

    return Scaffold(
      body: Stack(
        children: [
          // Konten scrollable
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50), // Ruang untuk tombol back tetap
                // Section gambar + nama + penjelasan singkat
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/ui/board_q.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0),
                          Text(
                            widget.data['nama'] ?? '',
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 36),
                          // Gambar dengan AnimatedSwitcher
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            child: Image.asset(
                              selectedImage!,
                              key: ValueKey<String>(selectedImage!),
                              height: 300,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.black54,
                            child: const Text(
                              "Ayam adalah hewan yang sering dipelihara di rumah. Ayam bisa bertelur dan juga berkokok.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        iconSize: 30,
                        onPressed: playSound,
                        icon: Image.asset(
                          'assets/ui/audio.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Tombol materi
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(materi.length, (index) {
                    final item = materi[index];

                    if (expandedIndex == index) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        child: Container(
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/ui/board_a.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['judul']!,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        expandedIndex = null;
                                        selectedImage = widget.data['gambar'];
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/ui/btn_x.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  item['isi']!,
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return SizedBox(
                      width: item['judul'] == "Tambahan"
                          ? MediaQuery.of(context).size.width - 32
                          : buttonWidth,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            expandedIndex = index;
                            selectedImage = item['gambar'];
                          });
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/ui/btn_blue.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            item['judul']!,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
          // Tombol back tetap di atas layar
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/ui/btn_back.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
