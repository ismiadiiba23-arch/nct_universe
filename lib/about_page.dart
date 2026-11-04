import 'package:flutter/material.dart';
import 'main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'About'),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.public, color: AppColors.neon, size: 56),
            const SizedBox(height: 16),
            const Text(
              'NCT UNIVERSE',
              style: TextStyle(
                color: AppColors.neon,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            const Text('Aplikasi Katalog dan Informasi Unit NCT',
                style: TextStyle(color: AppColors.gray)),
            const SizedBox(height: 20),
            const Text(
              'NCT Universe adalah aplikasi mobile berbasis Flutter yang '
              'dirancang sebagai media informasi dan katalog digital bagi '
              'penggemar NCT. Aplikasi ini menyediakan informasi empat unit '
              '(NCT 127, NCT DREAM, WayV, NCT WISH), profil anggota, dan '
              'diskografi dalam satu tempat.',
              style: TextStyle(height: 1.6),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Row(
                children: [
                  Icon(Icons.code, color: AppColors.neon),
                  SizedBox(width: 12),
                  Text('Dibuat dengan Flutter'),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.neon,
                  foregroundColor: AppColors.black,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('KEMBALI',
                    style: TextStyle(fontWeight: FontWeight.w800)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
