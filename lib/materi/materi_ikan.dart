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
      "isi": "ada mata, mulut, dan insang.",
      "gambar": "assets/images/ikan_kepala.png"
    },
    {
      "judul": "Insang",
      "isi":
      "alat pernapasan ikan, dipakai untuk bernapas di dalam air.\n\nApa kamu tahu?\nIkan bernapas tidak dengan paru-paru seperti manusia, tetapi dengan insang.",
      "gambar": "assets/images/ikan.png"
    },
    {
      "judul": "Sisik",
      "isi":
      "menempel di atas kulit ikan, membuat tubuh ikan licin dan melindungi tubuh.",
      "gambar": "assets/images/ikan_badan.png"
    },
    {
      "judul": "Sirip",
      "isi": "membantu ikan berenang dan menjaga keseimbangan.",
      "gambar": "assets/images/ikan_sirip.png"
    },
    {
      "judul": "Ekor",
      "isi": "mendorong tubuh agar ikan bisa bergerak maju di air.",
      "gambar": "assets/images/ikan_ekor.png"
    },
    {
      "judul": "Tambahan",
      "isi":
      "Ikan ada yang hidup di air tawar dan air laut. Makanan ikan bermacam-macam.",
      "gambar": "assets/images/ikan_ekor.png"
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
              "Ikan adalah hewan yang hidup di dalam air.",
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
                        color: Colors.lightBlue.shade50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ListTile(
                              title: Text(
                                item['judul']!,
                                style: const TextStyle(fontWeight: FontWeight.bold),
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
