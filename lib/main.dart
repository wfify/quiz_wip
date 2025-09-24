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
        scaffoldBackgroundColor: const Color(0xFF1A5FAD),
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 10, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  // Ukuran background dan tombol
  final double backgroundWidth = 340;
  final double backgroundHeight = 400;
  final double buttonWidth = 150;
  final double buttonHeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: backgroundWidth,
          height: backgroundHeight,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/ui/landing.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Judul
              const Text(
                "Belajar\nHewan",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              // Tombol Belajar
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BelajarPage()),
                  );
                },
                child: Container(
                  width: buttonWidth,
                  height: buttonHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ui/btn_title.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Belajar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Tombol Mulai Quiz
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Quiz()),
                  );
                },
                child: Container(
                  width: buttonWidth,
                  height: buttonHeight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ui/btn_title.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Mulai Quiz",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
