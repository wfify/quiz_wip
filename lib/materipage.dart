import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Belajar")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              title: const Text("Ayam (contoh)"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MateriPage(
                      title: "Ayam",
                    ),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Ikan"),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class MateriPage extends StatefulWidget {
  final String title;
  const MateriPage({super.key, required this.title});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  final List<String> points = [
    "Ceker",
    "Sayap",
    "Ekor",
  ];

  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Materi ${widget.title}")),
      body: Column(
        children: [
          // Gambar SVG placeholder
          Container(
            padding: const EdgeInsets.all(16),
            height: 200,
            child: SvgPicture.asset(
              'assets/images/shapes.svg',
              fit: BoxFit.contain,
            ),
          ),
          const Divider(),
          // Poin-poin materi
          Expanded(
            child: ListView.builder(
              itemCount: points.length,
              itemBuilder: (context, index) {
                final isExpanded = expandedIndex == index;
                return Card(
                  child: ExpansionTile(
                    title: Text(points[index]),
                    initiallyExpanded: isExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        expandedIndex = expanded ? index : null;
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "Penjelasan detail tentang ${points[index]} "
                              "akan ditampilkan di sini.",
                        ),
                      ),
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
