import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../data/db_helper.dart';
import 'question_model.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _loading = true;

  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer; // untuk update timer realtime
  String _elapsedTime = "00:00";

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
    super.dispose();
  }

  Future<void> _loadQuestions() async {
    final db = await DBHelper.instance.database;
    final data = await db.query('questions');

    final questions = data.map((e) => Question.fromMap(e)).toList();
    questions.shuffle(Random());

    setState(() {
      _questions = questions.take(10).toList();
      _loading = false;

      // mulai stopwatch & timer realtime
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final totalSeconds = _stopwatch.elapsed.inSeconds;
        final minutes = totalSeconds ~/ 60;
        final seconds = totalSeconds % 60;
        setState(() {
          _elapsedTime =
          '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        });
      });
    });
  }

  void _answerQuestion(int selectedIndex) {
    final question = _questions[_currentIndex];
    final correctIndex = question.correctAnswerIndex;
    final isCorrect = selectedIndex == correctIndex;

    if (isCorrect) _score++;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/ui/board_a.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Label Benar/Salah
              Container(
                width: 200,
                height: 70,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        isCorrect ? 'assets/ui/btn_green.png' : 'assets/ui/btn_red.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  isCorrect ? "Benar" : "Salah",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              // Hanya jawaban yang benar dan penjelasan
              Text(
                "Jawaban yang benar: ${question.options[correctIndex]}",
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                question.explanation ?? "Tidak ada penjelasan",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // tutup popup
                  if (_currentIndex < _questions.length - 1) {
                    setState(() {
                      _currentIndex++;
                    });
                  } else {
                    _showResult();
                  }
                },
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ui/btn_blue.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Lanjut",
                    style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResult() {
    _stopwatch.stop();
    _timer?.cancel();

    final totalSeconds = _stopwatch.elapsed.inSeconds;
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 360,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/ui/landing.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hasil Quiz",
                style: const TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 24),
              Text(
                "Benar $_score dari ${_questions.length} soal\n"
                    "Total waktu:\n ${minutes} menit ${seconds} detik",
                style: const TextStyle(fontSize: 24, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // tutup popup
                  Navigator.pop(context); // kembali landing
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ui/btn_blue.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "OK",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_questions.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("Tidak ada pertanyaan di database")),
      );
    }

    final question = _questions[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Tombol back tetap
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    'assets/ui/btn_back.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                const SizedBox(height: 8),
                // Timer
                Text(
                  "Waktu: $_elapsedTime",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  "Soal ${_currentIndex + 1}/${_questions.length}",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 16),

                // Board untuk soal + gambar
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(36),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/ui/board_a.png'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      if (question.imagePath != null && question.imagePath!.isNotEmpty)
                        Image.asset(
                          question.imagePath!,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      const SizedBox(height: 12),
                      Text(
                        question.questionText,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Opsi jawaban
                ...List.generate(question.options.length, (i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: GestureDetector(
                      onTap: () => _answerQuestion(i),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/ui/btn_title.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          question.options[i],
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
