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
      "gambar": "assets/images/cicak/cicak_kepala.png"
    },
    {
      "judul": "Lidah",
      "isi": "Lidah cicak panjang dan lengket, digunakan untuk menangkap serangga kecil.",
      "gambar": "assets/images/cicak/cicak_lidah.png"
    },
    {
      "judul": "Kaki",
      "isi": "Cicak memiliki 4 kaki dengan bantalan perekat sehingga bisa menempel di dinding atau plafon.",
      "gambar": "assets/images/cicak/cicak_kaki.png"
    },
    {
      "judul": "Ekor",
      "isi": "Ekor cicak bisa putus (autotomi) untuk mengelabui musuh, dan dapat tumbuh kembali.",
      "gambar": "assets/images/cicak/cicak_ekor.png"
    },
    {
      "judul": "Kulit",
      "isi": "Kulit cicak berfungsi melindungi tubuh dari lingkungan luar.",
      "gambar": "assets/images/cicak/cicak.png"
    },
    {
      "judul": "Tambahan",
      "isi": "Cicak biasanya hidup di sekitar rumah dan membantu mengurangi populasi serangga."
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
    await audioPlayer.play(AssetSource('audio/cicak.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/ui/btn_back.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            const SizedBox(height: 16),
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
                      // Gambar dengan AnimatedSwitcher untuk fade
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                        child: Image.asset(
                          selectedImage!,
                          key: ValueKey<String>(selectedImage!),
                          height: 180,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.black54,
                        child: const Text(
                          "Cicak adalah hewan reptil kecil yang sering hidup di sekitar rumah.",
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
                        if (item.containsKey('gambar')) {
                          selectedImage = item['gambar'];
                        }
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

    );
  }
}
