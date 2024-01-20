import 'package:flutter/material.dart';
import 'package:gen_move/app/shared/styles/app_colors.dart';

import '../../styles/app_images.dart';
import '../loading/loading.dart';

class ScaffoldPrimary extends StatelessWidget {
  const ScaffoldPrimary({
    super.key,
    required this.child,
    required this.isLoading,
    this.footer,
    this.header,
  });
  final Widget? header;
  final Widget? footer;
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        title: Image.asset(
          AppImages.marvel3,
          fit: BoxFit.contain,
          height: 50,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppColors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Loading(
        isLoading: isLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header ?? Container(),
            Expanded(child: child),
            footer ?? Container(),
          ],
        ),
      ),
    );
  }
}
