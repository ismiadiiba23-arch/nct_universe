import 'package:flutter/material.dart';
import 'nct_data.dart';
import 'main.dart';
import 'members_page.dart';

class UnitsPage extends StatelessWidget {
  const UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'NCT Units'),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: units.length,
        itemBuilder: (context, i) {
          final unit = units[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MembersPage(unit: unit)),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  AppImage(path: unit.image, width: 110, height: 110),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          unit.name,
                          style: const TextStyle(
                            color: AppColors.neon,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(unit.tagline,
                            style: const TextStyle(
                                color: AppColors.offWhite, fontSize: 13)),
                        const SizedBox(height: 8),
                        Text(
                          '${unit.members.length} anggota · debut ${unit.debut}',
                          style: const TextStyle(
                              color: AppColors.gray, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.neon),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
