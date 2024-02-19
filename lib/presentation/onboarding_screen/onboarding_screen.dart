import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 55.h,
            vertical: 279.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 56.v),
              CustomImageView(
                imagePath: ImageConstant.imgPolygon4,
                height: 74.v,
                width: 76.h,
              ),
              SizedBox(height: 21.v),
              Text(
                "Evapotranspiration",
                style: theme.textTheme.headlineMedium,
              ),
              Spacer(),
              CustomElevatedButton(
                width: 209.h,
                text: "Get Started",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
