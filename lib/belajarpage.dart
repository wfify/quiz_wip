import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'materi/materi_ayam.dart';
import 'materi/materi_ikan.dart';
import 'materi/materi_gajah.dart';
import 'materi/materi_cicak.dart';

void main() {
  runApp(const GameQuizApp());
}

class GameQuizApp extends StatelessWidget {
  const GameQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Edukasi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Edukasi Hewan"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BelajarPage()),
                );
              },
              child: const Text("Belajar"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizPage()),
                );
              },
              child: const Text("Mulai Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}

class BelajarPage extends StatelessWidget {
  const BelajarPage({super.key});

  final List<Map<String, String>> hewan = const [
    {"nama": "Ayam", "gambar": "assets/images/ayam.png"},
    {"nama": "Ikan", "gambar": "assets/images/ikan.png"},
    {"nama": "Gajah", "gambar": "assets/images/gajah.png"},
    {"nama": "Cicak", "gambar": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar Organ Hewan"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: hewan.length,
        itemBuilder: (context, index) {
          final data = hewan[index];

          return GestureDetector(
            onTap: () {
              if (data['nama'] == "Ayam") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MateriAyam(data: data)),
                );
              } else if (data['nama'] == "Ikan") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MateriIkan(data: data)),
                );
              } else if (data['nama'] == "Gajah") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MateriGajah(data: data)),
                );
              } else if (data['nama'] == "Cicak") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MateriCicak(data: data)),
                );
              }
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (data['gambar'] != null && data['gambar']!.isNotEmpty)
                    Hero(
                      tag: data['nama']!,
                      child: data['gambar']!.endsWith('.svg')
                          ? SvgPicture.asset(
                        data['gambar']!,
                        height: 100,
                      )
                          : Image.asset(
                        data['gambar']!,
                        height: 80,
                      ),
                    )
                  else
                    const Icon(Icons.image_not_supported, size: 80),
                  const SizedBox(height: 12),
                  Text(
                    data['nama']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      body: const Center(
        child: Text("Halaman Quiz (masih placeholder)"),
      ),
    );
  }
}
