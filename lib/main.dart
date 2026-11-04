import 'package:flutter/material.dart';
import 'about_page.dart';
import 'discography_page.dart';
import 'member_detail_page.dart';
import 'nct_data.dart';
import 'units_page.dart';

void main() {
  runApp(const NctUniverseApp());
}

// ============================================================
// TEMA DAN WIDGET BERSAMA (dipakai oleh semua halaman)
// ============================================================

class AppColors {
  static const Color neon = Color(0xFFC6F500);
  static const Color black = Color(0xFF101010);
  static const Color card = Color(0xFF1C1C1C);
  static const Color offWhite = Color(0xFFF5F5F2);
  static const Color gray = Color(0xFF777777);
}

ThemeData buildTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.neon,
      surface: AppColors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.offWhite,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.offWhite,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    ),
    useMaterial3: true,
  );
}

/// AppBar dengan tombol kembali memakai Navigator.pop().
AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title.toUpperCase()),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.neon),
      onPressed: () => Navigator.pop(context),
    ),
  );
}

/// Gambar dari assets dengan BoxFit.cover dan ukuran yang diatur.
/// Jika file belum ada, tampil placeholder abu-abu dengan ikon.
class AppImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final double radius;

  const AppImage({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Image.asset(
        path,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stack) => Container(
          width: width,
          height: height,
          color: const Color(0xFF2A2A2A),
          child: const Icon(Icons.person, color: AppColors.gray, size: 40),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 4, height: 20, color: AppColors.neon),
        const SizedBox(width: 10),
        Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: AppColors.offWhite,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }
}

// ============================================================
// APLIKASI DAN HALAMAN HOME
// ============================================================

class NctUniverseApp extends StatelessWidget {
  const NctUniverseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NCT Universe',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Rekomendasi anggota: satu dari tiap unit
    final picks = units.map((u) => MapEntry(u, u.members.first)).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.neon, width: 1.5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'NCT',
                      style: TextStyle(
                        color: AppColors.neon,
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        height: 1,
                      ),
                    ),
                    const Text(
                      'UNIVERSE',
                      style: TextStyle(
                        color: AppColors.offWhite,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'To the world, 여긴 NCT!',
                      style: TextStyle(color: AppColors.gray, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.neon,
                        foregroundColor: AppColors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const UnitsPage()),
                        );
                      },
                      icon: const Icon(Icons.explore),
                      label: const Text('DISCOVER YOUR UNIT',
                          style: TextStyle(fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Rekomendasi anggota
              const SectionTitle('Rekomendasi Anggota'),
              const SizedBox(height: 14),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: picks.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, i) {
                    final unit = picks[i].key;
                    final member = picks[i].value;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MemberDetailPage(
                                member: member, unitName: unit.name),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppImage(
                              path: member.image, width: 130, height: 150),
                          const SizedBox(height: 6),
                          Text(member.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),

              // Album terbaru
              const SectionTitle('Album Terbaru'),
              const SizedBox(height: 14),
              ...units.map((u) {
                final album = u.albums.last;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      AppImage(path: album.cover, width: 56, height: 56),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(album.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                            Text('${u.name} · ${album.year}',
                                style: const TextStyle(
                                    color: AppColors.gray, fontSize: 12)),
                          ],
                        ),
                      ),
                      const Icon(Icons.album, color: AppColors.neon),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 18),

              // Menu bawah
              Row(
                children: [
                  Expanded(
                    child: _MenuButton(
                      icon: Icons.library_music,
                      label: 'Discography',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const DiscographyPage()),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _MenuButton(
                      icon: Icons.info_outline,
                      label: 'About',
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AboutPage()),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.neon, size: 28),
            const SizedBox(height: 6),
            Text(label,
                style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
