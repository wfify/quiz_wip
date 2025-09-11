import 'db_helper.dart';

class SeedQuestion {
  static Future<void> seed() async {
    await DBHelper.instance.clearQuestions(); // hapus dulu biar tidak dobel

    final questions = [
      {
        "questionText": "Ayam termasuk jenis hewan apa?",
        "options": "Herbivora|Omnivora|Karnivora",
        "correctAnswerIndex": 1, // Omnivora
        "kodeHewan": "ayam",
      },
      {
        "questionText": "Ikan bernafas dengan apa?",
        "options": "Insang|Paru-paru|Kulit",
        "correctAnswerIndex": 0, // Insang
        "kodeHewan": "ikan",
      },
      {
        "questionText": "Bagian tubuh gajah yang panjang disebut?",
        "options": "Belalai|Taring|Tanduk",
        "correctAnswerIndex": 0, // Belalai
        "kodeHewan": "gajah",
      },
      {
        "questionText": "Cicak dapat memutuskan bagian tubuhnya untuk menyelamatkan diri. Apa itu?",
        "options": "Kaki|Ekor|Sayap",
        "correctAnswerIndex": 1, // Ekor
        "kodeHewan": "cicak",
      },
      {
        "questionText": "Ayam berkembang biak dengan cara?",
        "options": "Melahirkan|Bertelur|Membelah diri",
        "correctAnswerIndex": 1, // Bertelur
        "kodeHewan": "ayam",
      },
      {
        "questionText": "Ikan hidup di?",
        "options": "Darat|Air|Udara",
        "correctAnswerIndex": 1, // Air
        "kodeHewan": "ikan",
      },
      {
        "questionText": "Gajah memakan?",
        "options": "Daging|Rumput|Ikan",
        "correctAnswerIndex": 1, // Rumput
        "kodeHewan": "gajah",
      },
      {
        "questionText": "Cicak biasanya makan?",
        "options": "Serangga|Rumput|Biji-bijian",
        "correctAnswerIndex": 0, // Serangga
        "kodeHewan": "cicak",
      },
      {
        "questionText": "Ayam menghasilkan?",
        "options": "Telur|Susu|Madu",
        "correctAnswerIndex": 0, // Telur
        "kodeHewan": "ayam",
      },
      {
        "questionText": "Gajah termasuk hewan?",
        "options": "Terkecil|Terbesar di darat|Tertinggi",
        "correctAnswerIndex": 1, // Terbesar di darat
        "kodeHewan": "gajah",
      },
    ];

    for (var q in questions) {
      await DBHelper.instance.insertQuestion(q);
    }
  }
}
