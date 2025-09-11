// lib/quiz/question_model.dart

class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String kodeHewan; // untuk tandai pertanyaan terkait hewan

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.kodeHewan,
  });

  // Convert Map dari SQLite ke Object Question
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'],
      questionText: map['questionText'],
      options: (map['options'] as String).split('|'), // opsi disimpan dipisah dengan "|"
      correctAnswerIndex: map['correctAnswerIndex'],
      kodeHewan: map['kodeHewan'],
    );
  }

  // Convert Object ke Map untuk simpan ke SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'questionText': questionText,
      'options': options.join('|'),
      'correctAnswerIndex': correctAnswerIndex,
      'kodeHewan': kodeHewan,
    };
  }
}
