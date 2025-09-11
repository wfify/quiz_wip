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

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final db = await DBHelper.instance.database;
    final data = await db.query('questions');

    final questions = data.map((e) => Question.fromMap(e)).toList();

    // acak urutan pertanyaan
    questions.shuffle(Random());

    setState(() {
      _questions = questions.take(10).toList(); // ambil 10 soal
      _loading = false;
    });
  }

  void _answerQuestion(int selectedIndex) {
    final correct = _questions[_currentIndex].correctAnswerIndex;
    if (selectedIndex == correct) {
      _score++;
    }

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Hasil Quiz"),
        content: Text("Benar $_score dari ${_questions.length} soal"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // tutup dialog
              Navigator.pop(context); // kembali ke landing page
            },
            child: const Text("OK"),
          )
        ],
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
      appBar: AppBar(title: const Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Soal ${_currentIndex + 1}/${_questions.length}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              question.questionText,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ...List.generate(question.options.length, (i) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(i),
                  child: Text(question.options[i]),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}