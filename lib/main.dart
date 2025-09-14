import 'package:flutter/material.dart';
import 'belajarpage.dart'; // halaman belajar
import 'quiz/quiz.dart';  // halaman quiz
import 'data/db_helper.dart';  // helper database
import 'data/seed_question.dart'; // isi pertanyaan awal

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    print("=== Inisialisasi Database ===");
    await DBHelper.instance.database;
    print("Database berhasil dibuat/diakses.");

    print("=== Seeding Data ===");
    await SeedQuestion.seed();
    print("Seeding berhasil.");
  } catch (e, stacktrace) {
    print("Terjadi error saat init DB atau seeding: $e");
    print(stacktrace);
  }

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
                  MaterialPageRoute(builder: (context) => const Quiz()),
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
