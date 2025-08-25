import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

enum DownloadStatus { queued, downloading, paused, completed, error }

class DownloadCard extends StatelessWidget {
  final String thumbnailUrl;
  final String title;
  final String size;
  final String length;
  final double progress; // 0.0 → 1.0
  final DownloadStatus status;
  final bool isSelected; // ✅ for selection state
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final VoidCallback? onCancel;
  final VoidCallback? onRetry;
  final VoidCallback? onPlay;
  final VoidCallback? onSelect; // ✅ selection toggle

  const DownloadCard({
    super.key,
    required this.thumbnailUrl,
    required this.title,
    required this.size,
    required this.length,
    required this.status,
    this.progress = 0.0,
    this.isSelected = false,
    this.onPause,
    this.onResume,
    this.onCancel,
    this.onRetry,
    this.onPlay,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onSelect, // ✅ enter selection mode
      onTap: onSelect, // ✅ toggle selection
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.15) // ✅ highlight when selected
              : AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
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

            // Title + details + progress
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
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

                  // Size & length
                  Text(
                    "$length • $size",
                    style: const TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Extended, thinner progress bar
                  if (status == DownloadStatus.downloading ||
                      status == DownloadStatus.paused)
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: AppColors.mutedText.withOpacity(0.3),
                      color: status == DownloadStatus.paused
                          ? AppColors
                                .secondary // ✅ paused color
                          : AppColors.primary, // ✅ active download color
                      minHeight: 4, // ✅ thinner
                      borderRadius: BorderRadius.circular(2),
                    ),

                  if (status == DownloadStatus.error)
                    const Padding(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        "Download failed",
                        style: TextStyle(color: Colors.redAccent, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),

            // Right side: single slot for action (Play/Pause/Stop/etc.)
            const SizedBox(width: 8),
            _buildAction(),
          ],
        ),
      ),
    );
  }

  Widget _buildAction() {
    // ✅ Keep one slot, swap icons
    switch (status) {
      case DownloadStatus.queued:
        return IconButton(
          icon: const Icon(
            Icons.stop_circle_rounded,
            color: AppColors.mutedText,
          ),
          onPressed: onCancel,
        );

      case DownloadStatus.downloading:
        return IconButton(
          icon: const Icon(Icons.pause_rounded, color: AppColors.primary),
          onPressed: onPause,
        );

      case DownloadStatus.paused:
        return IconButton(
          icon: const Icon(Icons.play_arrow_rounded, color: AppColors.primary),
          onPressed: onResume,
        );

      case DownloadStatus.completed:
        return IconButton(
          icon: const Icon(
            Icons.play_circle_fill_rounded,
            color: AppColors.primary,
          ),
          onPressed: onPlay,
        );

      case DownloadStatus.error:
        return IconButton(
          icon: const Icon(Icons.refresh_rounded, color: AppColors.primary),
          onPressed: onRetry,
        );
    }
  }
}
