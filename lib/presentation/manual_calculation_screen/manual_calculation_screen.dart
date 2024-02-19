import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_leading_image.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_trailing_image.dart';
import 'package:habib_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:habib_s_application5/widgets/custom_elevated_button.dart';
import 'package:habib_s_application5/widgets/custom_text_form_field.dart';

class ManualCalculationScreen extends StatelessWidget {
  ManualCalculationScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController degreesCounterController = TextEditingController();

  TextEditingController minimumTemperature1Controller = TextEditingController();

  TextEditingController solarRadiationController = TextEditingController();

  TextEditingController minimumTemperature2Controller = TextEditingController();

  TextEditingController minimumTemperature3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 31.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDegreesCounter(context),
              SizedBox(height: 31.v),
              _buildMinimumTemperature1(context),
              SizedBox(height: 31.v),
              _buildSolarRadiation(context),
              SizedBox(height: 31.v),
              _buildMinimumTemperature2(context),
              SizedBox(height: 31.v),
              _buildMinimumTemperature3(context),
              SizedBox(height: 31.v),
              _buildCalculate(context),
              SizedBox(height: 30.v),
              Row(
                children: [
                  Text(
                    "80 mm/d",
                    style: theme.textTheme.headlineSmall,
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgPolygon4,
                    height: 29.v,
                    width: 30.h,
                    margin: EdgeInsets.only(left: 12.h),
                  ),
                ],
              ),
              SizedBox(height: 10.v),
              Container(
                width: 304.h,
                margin: EdgeInsets.only(right: 64.h),
                child: Text(
                  "Evaporation - 16%, Transpiration - 25%\n;ajknfprg ;erjklnpoer ;elrkjnneb ;wekjrbvjwer ;ekjrv",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelLarge,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildNinety(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 60.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgPolygon4,
        margin: EdgeInsets.only(
          left: 30.h,
          top: 18.v,
          bottom: 17.v,
        ),
      ),
      title: AppbarTitle(
        text: "Evapotranspiration",
        margin: EdgeInsets.only(left: 8.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMaterialSymbolsSort,
          margin: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 17.v,
          ),
        ),
      ],
      styleType: Style.bgShadow,
    );
  }

  /// Section Widget
  Widget _buildDegreesCounter(BuildContext context) {
    return CustomTextFormField(
      controller: degreesCounterController,
      hintText: "15 Degrees",
      hintStyle: theme.textTheme.bodySmall!,
    );
  }

  /// Section Widget
  Widget _buildMinimumTemperature1(BuildContext context) {
    return CustomTextFormField(
      controller: minimumTemperature1Controller,
      hintText: "Minimum Temperature",
    );
  }

  /// Section Widget
  Widget _buildSolarRadiation(BuildContext context) {
    return CustomTextFormField(
      controller: solarRadiationController,
      hintText: "Solar Radiation",
    );
  }

  /// Section Widget
  Widget _buildMinimumTemperature2(BuildContext context) {
    return CustomTextFormField(
      controller: minimumTemperature2Controller,
      hintText: "Minimum Temperature",
    );
  }

  /// Section Widget
  Widget _buildMinimumTemperature3(BuildContext context) {
    return CustomTextFormField(
      controller: minimumTemperature3Controller,
      hintText: "Minimum Temperature",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildCalculate(BuildContext context) {
    return CustomElevatedButton(
      height: 45.v,
      text: "Calculate",
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallMedium,
    );
  }

  /// Section Widget
  Widget _buildNinety(BuildContext context) {
    return Container(
      height: 88.v,
      width: 360.h,
      margin: EdgeInsets.only(left: 67.h),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(
                right: 284.h,
                bottom: 32.v,
              ),
              decoration: AppDecoration.outlineBlack,
              child: Text(
                "Automatic",
                style: CustomTextStyles.titleSmallBluegray900,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(left: 147.h),
              padding: EdgeInsets.symmetric(
                horizontal: 77.h,
                vertical: 32.v,
              ),
              decoration: AppDecoration.fillPrimary.copyWith(
                borderRadius: BorderRadiusStyle.customBorderTL5,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 5.v),
                child: Text(
                  "Manual",
                  style: theme.textTheme.titleSmall,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
