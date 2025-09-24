import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MateriIkan extends StatefulWidget {
  final Map<String, String> data;
  const MateriIkan({super.key, required this.data});

  @override
  State<MateriIkan> createState() => _MateriIkanState();
}

class _MateriIkanState extends State<MateriIkan> {
  String? selectedImage;
  int? expandedIndex;
  final AudioPlayer audioPlayer = AudioPlayer();

  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Ada mata, mulut, dan insang.",
      "gambar": "assets/images/ikan/ikan_kepala.png"
    },
    {
      "judul": "Insang",
      "isi":
      "Alat pernapasan ikan, dipakai untuk bernapas di dalam air.\n\nApa kamu tahu?\nIkan bernapas tidak dengan paru-paru seperti manusia, tetapi dengan insang.",
      "gambar": "assets/images/ikan/ikan.png"
    },
    {
      "judul": "Sisik",
      "isi":
      "Menempel di atas kulit ikan, membuat tubuh ikan licin dan melindungi tubuh.",
      "gambar": "assets/images/ikan/ikan_badan.png"
    },
    {
      "judul": "Sirip",
      "isi": "Membantu ikan berenang dan menjaga keseimbangan.",
      "gambar": "assets/images/ikan/ikan_sirip.png"
    },
    {
      "judul": "Ekor",
      "isi": "Mendorong tubuh agar ikan bisa bergerak maju di air.",
      "gambar": "assets/images/ikan/ikan_ekor.png"
    },
    {
      "judul": "Tambahan",
      "isi":
      "Ikan ada yang hidup di air tawar dan air laut. Makanan ikan bermacam-macam.",
      "gambar": "assets/images/ikan/ikan_ekor.png"
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
    await audioPlayer.play(AssetSource('audio/ikan_suara.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50), // ruang untuk tombol back tetap
                // Section gambar utama + nama + penjelasan singkat
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
                          Text(
                            widget.data['nama'] ?? '',
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 36),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            child: Image.asset(
                              selectedImage!,
                              key: ValueKey<String>(selectedImage!),
                              height: 170,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.black54,
                            child: const Text(
                              "Ikan adalah hewan yang hidup di dalam air.",
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
