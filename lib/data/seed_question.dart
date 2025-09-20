import 'db_helper.dart';

class SeedQuestion {
  static Future<void> seed() async {
    await DBHelper.instance.clearQuestions(); // hapus dulu biar tidak dobel

    final questions = [

      // ================= CICAK =================
      {
        "questionText": "Bagian tubuh cicak yang dapat putus untuk melindungi diri adalah …",
        "options": "Kaki|Ekor|Tangan",
        "correctAnswerIndex": 1,
        "kodeHewan": "cicak",
        "explanation": "Cicak dapat memutuskan ekornya (autotomi) untuk mengelabui musuh.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Bagian tubuh cicak yang digunakan untuk menempel di dinding adalah …",
        "options": "Lidah|Kaki|Ekor",
        "correctAnswerIndex": 1,
        "kodeHewan": "cicak",
        "explanation": "Cicak menempel di dinding dengan telapak kakinya yang memiliki bantalan perekat.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Organ luar cicak yang digunakan untuk melihat adalah …",
        "options": "Telinga|Mata|Hidung",
        "correctAnswerIndex": 1,
        "kodeHewan": "cicak",
        "explanation": "Mata cicak berfungsi sebagai organ penglihatan.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Bagian tubuh cicak yang digunakan untuk menangkap serangga adalah …",
        "options": "Lidah|Ekor|Kaki",
        "correctAnswerIndex": 0,
        "kodeHewan": "cicak",
        "explanation": "Lidah cicak panjang dan lengket sehingga dapat menangkap serangga.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Ekor cicak yang putus dapat …",
        "options": "Mati|Tumbuh kembali|Menghilang",
        "correctAnswerIndex": 1,
        "kodeHewan": "cicak",
        "explanation": "Ekor cicak dapat tumbuh kembali setelah putus.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Organ luar cicak yang berjumlah empat dan digunakan untuk berjalan adalah …",
        "options": "Kaki|Sayap|Tangan",
        "correctAnswerIndex": 0,
        "kodeHewan": "cicak",
        "explanation": "Cicak memiliki empat kaki untuk berjalan dan memanjat.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Lubang hidung cicak terdapat pada bagian …",
        "options": "Kepala|Ekor|Kaki",
        "correctAnswerIndex": 0,
        "kodeHewan": "cicak",
        "explanation": "Lubang hidung cicak terdapat di bagian kepala untuk bernapas.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Kulit cicak berfungsi untuk …",
        "options": "Bernapas|Melindungi tubuh|Menangkap makanan",
        "correctAnswerIndex": 1,
        "kodeHewan": "cicak",
        "explanation": "Kulit cicak berfungsi melindungi tubuh dari gangguan luar.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Bagian tubuh cicak yang bisa tumbuh kembali setelah putus adalah …",
        "options": "Ekor|Kepala|Kaki",
        "correctAnswerIndex": 0,
        "kodeHewan": "cicak",
        "explanation": "Ekor cicak dapat tumbuh kembali setelah putus.",
        "imagePath": "assets/images/cicak.png"
      },
      {
        "questionText": "Mata cicak termasuk organ luar yang berfungsi untuk …",
        "options": "Mendengar|Melihat|Mengendus",
        "correctAnswerIndex": 1,
        "kodeHewan": "cicak",
        "explanation": "Mata cicak berfungsi untuk melihat.",
        "imagePath": "assets/images/cicak.png"
      },

      // ================= AYAM =================
      {
        "questionText": "Bagian tubuh ayam yang digunakan untuk mematuk makanan adalah …",
        "options": "Kaki|Paruh|Sayap",
        "correctAnswerIndex": 1,
        "kodeHewan": "ayam",
        "explanation": "Ayam menggunakan paruhnya untuk mematuk makanan.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Organ luar ayam yang terdapat di kepala dan berwarna merah disebut …",
        "options": "Jengger|Bulu|Paruh",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Jengger adalah tonjolan merah di kepala ayam.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Sayap ayam merupakan organ luar yang berfungsi untuk …",
        "options": "Berlari|Terbang pendek|Bernapas",
        "correctAnswerIndex": 1,
        "kodeHewan": "ayam",
        "explanation": "Sayap ayam membantu terbang jarak pendek dan menjaga keseimbangan.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Kaki ayam memiliki cakar yang berfungsi untuk …",
        "options": "Mengais tanah|Menyapu lantai|Menggali lubang besar",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Cakar ayam digunakan untuk mengais tanah mencari makanan.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Bulu ayam sebagai organ luar berfungsi untuk …",
        "options": "Melindungi dari dingin|Bernapas|Mengunyah",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Bulu ayam melindungi tubuh dan menjaga suhu tetap hangat.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Ekor ayam sebagai organ luar berfungsi untuk …",
        "options": "Menjaga keseimbangan|Bernapas|Mematuk",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Ekor ayam membantu menjaga keseimbangan tubuh.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Mata ayam berfungsi sebagai organ luar untuk …",
        "options": "Melihat|Mendengar|Mengendus",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Mata ayam berfungsi untuk melihat.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Paruh ayam termasuk organ luar, apa fungsinya?",
        "options": "Mematuk makanan|Bernapas|Mendengar",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Paruh ayam digunakan untuk mematuk dan mengambil makanan.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Jengger ayam terdapat di bagian …",
        "options": "Kepala|Kaki|Ekor",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Jengger ayam terletak di bagian kepala.",
        "imagePath": "assets/images/ayam.png"
      },
      {
        "questionText": "Sayap ayam terletak di bagian tubuh …",
        "options": "Samping tubuh|Kepala|Ekor",
        "correctAnswerIndex": 0,
        "kodeHewan": "ayam",
        "explanation": "Sayap ayam menempel di samping tubuh.",
        "imagePath": "assets/images/ayam.png"
      },

      // ================= GAJAH =================
      {
        "questionText": "Organ luar gajah yang panjang dan lentur adalah …",
        "options": "Telinga|Belalai|Ekor",
        "correctAnswerIndex": 1,
        "kodeHewan": "gajah",
        "explanation": "Belalai gajah panjang dan lentur untuk mengambil makanan dan minum.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Belalai gajah digunakan untuk …",
        "options": "Mendengar|Mengambil makanan|Berjalan",
        "correctAnswerIndex": 1,
        "kodeHewan": "gajah",
        "explanation": "Belalai digunakan gajah untuk mengambil makanan, minum, dan menyemprot air.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Telinga gajah yang lebar berfungsi untuk …",
        "options": "Mengatur suhu tubuh|Bernapas|Mengunyah",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Telinga gajah membantu mendengar dan mengatur suhu tubuh.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Gading gajah merupakan organ luar yang berfungsi untuk …",
        "options": "Melindungi diri|Bernapas|Mengais tanah",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Gading digunakan untuk melindungi diri dan menggali tanah.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Ekor gajah sebagai organ luar berfungsi untuk …",
        "options": "Mengusir serangga|Mengambil makanan|Bernapas",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Ekor gajah digunakan untuk mengusir lalat dan serangga.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Kaki gajah yang besar termasuk organ luar yang berfungsi untuk …",
        "options": "Menopang tubuh|Menggali tanah|Bernapas",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Kaki gajah yang besar menopang tubuh yang berat.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Mata gajah termasuk organ luar yang berfungsi untuk …",
        "options": "Melihat|Bernapas|Mendengar",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Mata gajah berfungsi sebagai alat penglihatan.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Gading gajah terletak di bagian …",
        "options": "Kepala|Ekor|Kaki",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Gading gajah terdapat di kepala, tumbuh keluar dari rahang atas.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Belalai gajah merupakan organ luar yang juga berfungsi untuk …",
        "options": "Menyemprot air|Bernapas|Melihat",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Belalai gajah digunakan untuk menyemprot air.",
        "imagePath": "assets/images/gajah.png"
      },
      {
        "questionText": "Telinga gajah terletak di bagian …",
        "options": "Kepala|Kaki|Ekor",
        "correctAnswerIndex": 0,
        "kodeHewan": "gajah",
        "explanation": "Telinga gajah terletak di bagian kepala.",
        "imagePath": "assets/images/gajah.png"
      },

      // ================= IKAN =================
      {
        "questionText": "Sirip ikan merupakan organ luar yang berfungsi untuk …",
        "options": "Berenang|Bernapas|Mengunyah",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Sirip ikan digunakan untuk berenang dan menjaga keseimbangan.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Ekor ikan sebagai organ luar berfungsi untuk …",
        "options": "Mendorong tubuh|Bernapas|Menggali",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Ekor ikan membantu mendorong tubuh agar bergerak maju di air.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Insang ikan terletak di bagian …",
        "options": "Kepala|Ekor|Sirip",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Insang ikan terletak di sisi kepala dan berfungsi untuk bernapas.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Sisik ikan sebagai organ luar berfungsi untuk …",
        "options": "Melindungi tubuh|Bernapas|Mengunyah",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Sisik ikan menutupi tubuh dan melindungi dari bahaya.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Mata ikan merupakan organ luar yang berfungsi untuk …",
        "options": "Melihat|Bernapas|Mendengar",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Mata ikan berfungsi sebagai alat penglihatan.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Mulut ikan sebagai organ luar berfungsi untuk …",
        "options": "Memasukkan makanan|Bernapas|Mendengar",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Mulut ikan digunakan untuk memasukkan makanan.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Sirip punggung ikan terletak di bagian …",
        "options": "Atas tubuh|Samping tubuh|Bawah tubuh",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Sirip punggung berada di bagian atas tubuh ikan.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Sirip dada ikan terletak di bagian …",
        "options": "Samping tubuh|Ekor|Kepala",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "Sirip dada berada di samping tubuh ikan, dekat kepalanya.",
        "imagePath": "assets/images/ikan.png"
      },
      {
        "questionText": "Organ luar ikan yang digunakan untuk bernapas adalah …",
        "options": "Insang|Sirip|Sisik",
        "correctAnswerIndex": 0,
        "kodeHewan": "ikan",
        "explanation": "[Insang] digunakan ikan untuk bernapas di air.",
        "imagePath": "assets/images/ikan.png"
      },
    ];

    for (var q in questions) {
      await DBHelper.instance.insertQuestion(q);
    }
  }
}
