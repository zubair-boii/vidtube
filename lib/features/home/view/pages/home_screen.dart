import 'package:flutter/material.dart';
import 'package:vidtube/core/utils/constants.dart';
import 'package:vidtube/features/home/view/widgets/custom_textfield.dart';

import '../../../../core/theme/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.logoGradientT, width: 60),
            const Text('VidTube', style: TextStyle(color: AppColors.primary)),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_rounded)),
        ],
      ),
      body: Column(
        children: [
          // image as background
          Image.asset(Constants.bgImg, opacity: AlwaysStoppedAnimation(0.4)),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                CustomTextfield(
                  hintText: "Enter URL",
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.search_rounded),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
