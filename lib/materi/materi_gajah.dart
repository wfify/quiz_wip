import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MateriGajah extends StatefulWidget {
  final Map<String, String> data;
  const MateriGajah({super.key, required this.data});

  @override
  State<MateriGajah> createState() => _MateriGajahState();
}

class _MateriGajahState extends State<MateriGajah> {
  String? selectedImage;
  int? expandedIndex;
  final AudioPlayer audioPlayer = AudioPlayer();

  final List<Map<String, String>> materi = const [
    {
      "judul": "Kepala",
      "isi": "Ada mata, telinga, belalai, dan gading.",
      "gambar": "assets/images/gajah/gajah_kepala.png"
    },
    {
      "judul": "Belalai",
      "isi":
      "Panjang dan bisa digerakkan. Belalai dipakai untuk mengambil makanan, minum, bahkan menyemprot air.",
      "gambar": "assets/images/gajah/gajah_belalai.png"
    },
    {
      "judul": "Telinga besar",
      "isi":
      "Digunakan untuk mendengar dan mengatur suhu tubuh gajah.\n\nApa kamu tahu?\nGajah punya telinga yang sangat besar. Di dalam telinganya ada banyak sekali pembuluh darah. Saat cuaca panas, darah di telinga gajah akan jadi lebih panas. Gajah mengibaskan telinganya ke kanan dan kiri. Udara yang lewat membantu mendinginkan darah di telinga. Setelah dingin, darah itu mengalir lagi ke seluruh tubuh, sehingga tubuh gajah ikut menjadi lebih sejuk.",
      "gambar": "assets/images/gajah/gajah_telinga.png"
    },
    {
      "judul": "Gading",
      "isi": "Gigi panjang dan keras yang tumbuh keluar. Dipakai untuk melindungi diri dan menggali tanah.",
      "gambar": "assets/images/gajah/gajah_gading.png"
    },
    {
      "judul": "Kaki",
      "isi": "Kaki yang besar dan kuat untuk menopang tubuh gajah yang berat.",
      "gambar": "assets/images/gajah/gajah_kaki.png"
    },
    {
      "judul": "Ekor",
      "isi": "Dipakai untuk mengusir lalat atau serangga yang hinggap di tubuh gajah.",
      "gambar": "assets/images/gajah/gajah_ekor.png"
    },
  ];

  final Map<String, String> tambahan = const {
    "judul": "Tambahan",
    "isi":
    "Gajah suka makan rumput, daun, dan buah-buahan. Gajah hidup berkelompok dan pandai menolong temannya.",
    "gambar": "assets/images/gajah/gajah.png"
  };

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
    await audioPlayer.play(AssetSource('audio/gajah.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;

    return Scaffold(
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50), // beri jarak untuk back button
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
                          const SizedBox(height: 8),
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
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            child: Image.asset(
                              selectedImage!,
                              key: ValueKey<String>(selectedImage!),
                              height: 250,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(12),
                            color: Colors.black54,
                            child: const Text(
                              "Gajah adalah hewan darat terbesar di dunia. Tubuhnya besar sekali!",
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
                                  style: const TextStyle(fontSize: 24, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    return SizedBox(
                      width: buttonWidth,
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
                                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
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
