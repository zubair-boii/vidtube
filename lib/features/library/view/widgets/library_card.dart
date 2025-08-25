import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class LibraryCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String size;
  final String length;

  const LibraryCard({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.size,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.transparent, // change color/transparency if needed
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              thumbnailUrl,
              width: 80,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Title + details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.lightText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "$length • $size",
                  style: const TextStyle(
                    color: AppColors.mutedText,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Action icon
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.play_arrow_rounded,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
