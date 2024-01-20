import 'package:flutter/material.dart';
import 'package:gen_move/app/shared/styles/app_colors.dart';
import 'package:gen_move/app/shared/styles/app_text_styles.dart';

import 'color_loader.dart';

class Loading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final bool isMessage;

  const Loading({
    super.key,
    required this.isLoading,
    required this.child,
    this.isMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        child,
        SizedBox(
          height: size.height,
          width: size.width,
          child: Visibility(
            visible: isLoading,
            child: Container(
              width: double.infinity,
              height: size.height,
              color: Colors.black.withOpacity(0.6),
              child: isMessage
                  ? const Center(
                      child: SizedBox(
                        height: 70,
                        child: Column(
                          children: [
                            Text('Processando...',
                                style: AppTextStyles.simpleWhite),
                            ColorLoader(
                              dotOneColor: AppColors.blue,
                              dotTwoColor: AppColors.blue,
                              dotThreeColor: AppColors.blue,
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Center(
                      child: SizedBox(
                        height: 50,
                        child: ColorLoader(
                          dotOneColor: AppColors.blue,
                          dotTwoColor: AppColors.blue,
                          dotThreeColor: AppColors.blue,
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
