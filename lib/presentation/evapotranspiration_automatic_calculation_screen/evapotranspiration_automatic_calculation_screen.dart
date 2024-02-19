import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_leading_image.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_trailing_image.dart';
import 'package:habib_s_application5/widgets/app_bar/custom_app_bar.dart';

class EvapotranspirationAutomaticCalculationScreen extends StatelessWidget {
  const EvapotranspirationAutomaticCalculationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          height: SizeUtils.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              _buildSeventeen(context),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: EdgeInsets.only(right: 215.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 67.h,
                    vertical: 32.v,
                  ),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL5,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 5.v),
                      Text(
                        "Automatic",
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 30.h,
                    top: 95.v,
                    right: 30.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFourteen(context),
                      SizedBox(height: 30.v),
                      Text(
                        "80 mm/d",
                        style: theme.textTheme.headlineSmall,
                      ),
                      SizedBox(height: 6.v),
                      Text(
                        "University Of Ibadan, Ibadan.",
                        style: theme.textTheme.titleMedium,
                      ),
                      SizedBox(height: 11.v),
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
                      SizedBox(height: 35.v),
                      Card(
                        clipBehavior: Clip.antiAlias,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyle.roundedBorder15,
                        ),
                        child: Container(
                          height: 478.v,
                          width: 368.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusStyle.roundedBorder15,
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgMapOfBirmingham,
                                height: 478.v,
                                width: 368.h,
                                radius: BorderRadius.circular(
                                  15.h,
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 7.h),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildSixtyEight(context),
                                      SizedBox(height: 358.v),
                                      _buildSixtySeven(context),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: AppDecoration.fillBlack,
                  child: Container(
                    margin: EdgeInsets.only(left: 222.h),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 42.v,
                    ),
                    decoration: AppDecoration.fillGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgIcRoundHome,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 14.h,
                                  top: 2.v,
                                  bottom: 3.v,
                                ),
                                child: Text(
                                  "Home",
                                  style: CustomTextStyles.bodySmallPoppins,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 48.v),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.h,
                            vertical: 10.v,
                          ),
                          decoration: AppDecoration.fillPrimary1.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgFontistoNavIconGrid,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                margin: EdgeInsets.only(bottom: 1.v),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.h,
                                  top: 3.v,
                                  bottom: 3.v,
                                ),
                                child: Text(
                                  "History",
                                  style:
                                      CustomTextStyles.bodySmallPoppinsPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 48.v),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
  Widget _buildSeventeen(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 77.h,
          vertical: 31.v,
        ),
        decoration: AppDecoration.outlineBlack,
        child: Text(
          "Manual",
          style: CustomTextStyles.titleSmallBluegray900,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFourteen(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSearch,
            height: 15.adaptSize,
            width: 15.adaptSize,
            margin: EdgeInsets.only(top: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 22.h,
              top: 1.v,
            ),
            child: Text(
              "Search anything",
              style: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtyEight(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 8.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 94.h,
            margin: EdgeInsets.only(bottom: 60.v),
            decoration: AppDecoration.outlineBlack900.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 8.v,
                    bottom: 7.v,
                  ),
                  child: Text(
                    "Map",
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                SizedBox(
                  height: 29.v,
                  child: VerticalDivider(
                    width: 1.h,
                    thickness: 1.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.v),
                  child: Text(
                    "Satellite",
                    style: CustomTextStyles.bodySmallRobotoGray700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMinimize,
                height: 53.v,
                width: 28.h,
              ),
              SizedBox(height: 8.v),
              Container(
                height: 28.adaptSize,
                width: 28.adaptSize,
                padding: EdgeInsets.symmetric(
                  horizontal: 8.h,
                  vertical: 4.v,
                ),
                decoration: AppDecoration.outlineBlack900.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder2,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgPegmanOffscreen2x,
                  height: 20.v,
                  width: 12.h,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtySeven(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgSettings,
          height: 19.v,
          width: 61.h,
          margin: EdgeInsets.only(bottom: 3.v),
        ),
        Container(
          height: 15.v,
          width: 121.h,
          margin: EdgeInsets.only(
            left: 12.h,
            top: 7.v,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 15.v,
                  width: 121.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray100Cc,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Map data @2019 Google",
                  style: CustomTextStyles.bodySmallRobotoBlack900,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 70.h,
          margin: EdgeInsets.only(
            left: 1.h,
            top: 7.v,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 5.h,
            vertical: 1.v,
          ),
          decoration: AppDecoration.fillGrayCc,
          child: Text(
            "Terms of Use",
            style: CustomTextStyles.bodySmallRobotoBlack900,
          ),
        ),
        Container(
          height: 15.v,
          width: 94.h,
          margin: EdgeInsets.only(
            left: 1.h,
            top: 7.v,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 15.v,
                  width: 94.h,
                  decoration: BoxDecoration(
                    color: appTheme.gray100Cc,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Report a map error",
                  style: CustomTextStyles.bodySmallRobotoBlack900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
