// lib/quiz/question_model.dart

class Question {
  final int? id; // nullable karena SQLite autoincrement
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String kodeHewan; // untuk tandai pertanyaan terkait hewan
  final String? explanation; // penjelasan jawaban
  final String? imagePath;   // tambahan untuk gambar (opsional)
  final String? audioPath;   // tambahan untuk audio (opsional)

  Question({
    this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.kodeHewan,
    this.explanation,
    this.imagePath,
    this.audioPath,
  });

  // Convert Map dari SQLite ke Object Question
  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] as int?,
      questionText: map['questionText'] as String? ?? '',
      options: (map['options'] as String?)?.split('|') ?? [],
      correctAnswerIndex: map['correctAnswerIndex'] as int? ?? 0,
      kodeHewan: map['kodeHewan'] as String? ?? '',
      explanation: map['explanation'] as String?,
      imagePath: map['imagePath'] as String?, // opsional
      audioPath: map['audioPath'] as String?, // opsional
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
      'explanation': explanation,
      'imagePath': imagePath,
      'audioPath': audioPath,
    };
  }
}
