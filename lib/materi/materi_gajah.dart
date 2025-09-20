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
      "isi": "ada mata, telinga, belalai, dan gading.",
      "gambar": "assets/images/gajah_kepala.png"
    },
    {
      "judul": "Belalai",
      "isi":
      "panjang dan bisa digerakkan. Belalai dipakai untuk mengambil makanan, minum, bahkan menyemprot air.",
      "gambar": "assets/images/gajah_belalai.png"
    },
    {
      "judul": "Telinga besar",
      "isi":
      "digunakan untuk mendengar dan mengatur suhu tubuh gajah.\n\nApa kamu tahu?\nGajah punya telinga yang sangat besar. Di dalam telinganya ada banyak sekali pembuluh darah. Saat cuaca panas, darah di telinga gajah akan jadi lebih panas. Gajah mengibaskan telinganya ke kanan dan kiri. Udara yang lewat membantu mendinginkan darah di telinga. Setelah dingin, darah itu mengalir lagi ke seluruh tubuh, sehingga tubuh gajah ikut menjadi lebih sejuk.",
      "gambar": "assets/images/gajah_telinga.png"
    },
    {
      "judul": "Gading",
      "isi": "gigi panjang dan keras yang tumbuh keluar. Dipakai untuk melindungi diri dan menggali tanah.",
      "gambar": "assets/images/gajah_gading.png"
    },
    {
      "judul": "Kaki",
      "isi": "kaki yang besar dan kuat untuk menopang tubuh gajah yang berat.",
      "gambar": "assets/images/gajah_kaki.png"
    },
    {
      "judul": "Ekor",
      "isi": "dipakai untuk mengusir lalat atau serangga yang hinggap di tubuh gajah.",
      "gambar": "assets/images/gajah_ekor.png"
    },
  ];

  final Map<String, String> tambahan = const {
    "judul": "Tambahan",
    "isi":
    "Gajah suka makan rumput, daun, dan buah-buahan. Gajah hidup berkelompok dan pandai menolong temannya.",
    "gambar": "assets/images/gajah.png"
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
    await audioPlayer.play(AssetSource('audio/gajah_trumpet.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;

    return Scaffold(
      appBar: AppBar(title: Text("Materi ${widget.data['nama']}")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Stack untuk gambar + tombol speaker di kanan atas
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
                      height: 200,
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
              "Gajah adalah hewan darat terbesar di dunia. Tubuhnya besar sekali!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(materi.length, (index) {
                      final item = materi[index];

                      if (expandedIndex == index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width - 32,
                          child: Card(
                            color: Colors.blue.shade50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ListTile(
                                  title: Text(item['judul']!,
                                      style:
                                      const TextStyle(fontWeight: FontWeight.bold)),
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

                      return SizedBox(
                        width: buttonWidth,
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
                  const SizedBox(height: 16),
                  // Tambahan
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: Card(
                      child: ExpansionTile(
                        title: Text(tambahan['judul']!),
                        onExpansionChanged: (expanded) {
                          setState(() {
                            selectedImage =
                            expanded ? tambahan['gambar'] : widget.data['gambar'];
                          });
                        },
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(tambahan['isi']!),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
