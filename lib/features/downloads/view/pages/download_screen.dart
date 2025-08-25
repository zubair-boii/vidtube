import '../widgets/download_card.dart';
import "package:flutter/material.dart";

class DownloadsScreen extends StatefulWidget {
  const DownloadsScreen({super.key});

  @override
  State<DownloadsScreen> createState() => _DownloadsScreenState();
}

class _DownloadsScreenState extends State<DownloadsScreen> {
  final List<int> _selectedIndexes = [];

  @override
  Widget build(BuildContext context) {
    final downloads = [
      {
        "title": "Video 1",
        "thumbnail": "https://picsum.photos/200/100?1",
        "size": "20mb",
        "length": "2:30",
        "status": DownloadStatus.downloading,
        "progress": 0.4,
      },
      {
        "title": "Video 2",
        "thumbnail": "https://picsum.photos/200/100?2",
        "size": "15mb",
        "length": "1:20",
        "status": DownloadStatus.paused,
        "progress": 0.6,
      },
      {
        "title": "Video 3",
        "thumbnail": "https://picsum.photos/200/100?3",
        "size": "30mb",
        "length": "3:50",
        "status": DownloadStatus.completed,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text(
          _selectedIndexes.isEmpty
              ? "Downloads"
              : "${_selectedIndexes.length} selected",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.download_for_offline_outlined),
          ),
          if (_selectedIndexes.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_rounded, color: Colors.redAccent),
              onPressed: () {
                // delete selected
              },
            ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: downloads.length,
        itemBuilder: (context, index) {
          final d = downloads[index];
          return DownloadCard(
            thumbnailUrl: d["thumbnail"].toString(),
            title: d["title"].toString(),
            size: d["size"].toString(),
            length: d["length"].toString(),
            status: d["status"] as DownloadStatus,
            progress: (d["progress"] ?? 0.0) as double,
            isSelected: _selectedIndexes.contains(index),
            onSelect: () {
              setState(() {
                if (_selectedIndexes.contains(index)) {
                  _selectedIndexes.remove(index);
                } else {
                  _selectedIndexes.add(index);
                }
              });
            },
          );
        },
      ),
    );
  }
}
