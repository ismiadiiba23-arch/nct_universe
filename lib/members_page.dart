import 'package:flutter/material.dart';
import 'main.dart';
import 'member_detail_page.dart';
import 'nct_data.dart';

/// Satu halaman untuk keempat unit: data Unit dikirim lewat constructor.
/// Menampilkan info unit dan grid anggotanya.
class MembersPage extends StatelessWidget {
  final Unit unit;
  const MembersPage({super.key, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, unit.name),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: AppImage(
                        path: unit.image,
                        width: double.infinity,
                        height: double.infinity,
                        radius: 18),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            Text(
              unit.name,
              style: const TextStyle(
                color: AppColors.neon,
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text('Debut ${unit.debut} · ${unit.tagline}',
                style: const TextStyle(color: AppColors.gray)),
            const SizedBox(height: 14),
            Text(unit.description,
                style: const TextStyle(height: 1.5, fontSize: 14)),
            const SizedBox(height: 24),
            const SectionTitle('Members'),
            const SizedBox(height: 14),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: unit.members.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 0.85,
              ),
              itemBuilder: (context, i) {
                final m = unit.members[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MemberDetailPage(
                            member: m, unitName: unit.name),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: AppImage(
                              path: m.image,
                              width: double.infinity,
                              height: double.infinity),
                        ),
                        const SizedBox(height: 8),
                        Text(m.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
