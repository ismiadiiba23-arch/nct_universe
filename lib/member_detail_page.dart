import 'package:flutter/material.dart';
import 'nct_data.dart';
import 'main.dart';

/// Satu halaman profil untuk semua anggota.
class MemberDetailPage extends StatelessWidget {
  final Member member;
  final String unitName;

  const MemberDetailPage(
      {super.key, required this.member, required this.unitName});

  Widget _row(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.neon),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      color: AppColors.gray, fontSize: 12)),
              const SizedBox(height: 2),
              Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, member.name),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AppImage(
                  path: member.image,
                  width: 270,
                  height: 360,
                  radius: 20),
            ),
            const SizedBox(height: 18),
            Text(
              member.name.toUpperCase(),
              style: const TextStyle(
                color: AppColors.neon,
                fontSize: 34,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 18),
            _row(Icons.groups, 'Unit', unitName),
            _row(Icons.cake, 'Tanggal lahir', member.birthday),
            _row(Icons.public, 'Asal', member.nationality),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.neon,
                  side: const BorderSide(color: AppColors.neon),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Kembali'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
