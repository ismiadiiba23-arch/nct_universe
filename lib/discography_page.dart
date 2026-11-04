import 'package:flutter/material.dart';
import 'nct_data.dart';
import 'main.dart';

class DiscographyPage extends StatelessWidget {
  const DiscographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Discography'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          for (final unit in units) ...[
            SectionTitle(unit.name),
            const SizedBox(height: 12),
            SizedBox(
              height: 190,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: unit.albums.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final a = unit.albums[i];
                  return SizedBox(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppImage(path: a.cover, width: 130, height: 130),
                        const SizedBox(height: 6),
                        Text(a.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700)),
                        Text('${a.year} · ${a.type}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: AppColors.gray, fontSize: 11)),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}
