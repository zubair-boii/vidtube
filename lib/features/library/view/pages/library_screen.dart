import 'package:flutter/material.dart';
import 'package:vidtube/features/library/view/widgets/library_card.dart';
import '../../../../core/theme/colors.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> videoDetails = [
      {
        "title": "Fortnite gameplay",
        "imageUrl":
            "https://cms-assets.unrealengine.com/cm6l5gfpm05kr07my04cqgy2x/cmelvzjjpak0v07msiwfm8di8",
        "length": "2:30",
        "size": "20mb",
      },
      {
        "title": "Mountains 4k video",
        "imageUrl":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg/960px-Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg",
        "length": "1:40",
        "size": "11mb",
      },
      {
        "title": "Fastest Animals",
        "imageUrl":
            "https://img.freepik.com/free-photo/close-up-cheetah-nature_23-2151917108.jpg?semt=ais_hybrid&w=740&q=80",
        "length": "5:47",
        "size": "40mb",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Downloads",
              style: TextStyle(color: AppColors.lightText),
            ),
          ],
        ),

        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: videoDetails.length,
          itemBuilder: (context, index) {
            return LibraryCard(
              thumbnailUrl: videoDetails[index]["imageUrl"],
              title: videoDetails[index]["title"],
              size: videoDetails[index]["size"],
              length: videoDetails[index]["length"],
            );
          },
        ),
      ),
    );
  }
}
