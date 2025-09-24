import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'materi/materi_ayam.dart';
import 'materi/materi_ikan.dart';
import 'materi/materi_gajah.dart';
import 'materi/materi_cicak.dart';

class BelajarPage extends StatelessWidget {
  const BelajarPage({super.key});

  final List<Map<String, String>> hewan = const [
    {"nama": "Ayam", "gambar": "assets/images/ayam/ayam.png"},
    {"nama": "Ikan", "gambar": "assets/images/ikan/ikan.png"},
    {"nama": "Gajah", "gambar": "assets/images/gajah/gajah.png"},
    {"nama": "Cicak", "gambar": "assets/images/cicak/cicak.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/ui/board_a.png'),
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
                    padding: const EdgeInsets.all(12),
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
                          textAlign: TextAlign.center,
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
          ),
          // Tombol back tetap di atas layar
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'assets/ui/btn_back.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
