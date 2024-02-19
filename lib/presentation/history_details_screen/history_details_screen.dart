import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_leading_image.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_trailing_image.dart';
import 'package:habib_s_application5/widgets/app_bar/custom_app_bar.dart';

class HistoryDetailsScreen extends StatelessWidget {
  const HistoryDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgArrowLeft,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                onTap: () {
                                  onTapImgArrowLeft(context);
                                }),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 2.h, top: 2.v, bottom: 3.v),
                                child: Text("Back",
                                    style: CustomTextStyles.bodySmallPoppins))
                          ]),
                      SizedBox(height: 29.v),
                      _buildTwenty(context),
                      SizedBox(height: 8.v),
                      Row(children: [
                        Text("80 mm/d", style: theme.textTheme.headlineSmall),
                        CustomImageView(
                            imagePath: ImageConstant.imgPolygon4,
                            height: 29.v,
                            width: 30.h,
                            margin: EdgeInsets.only(left: 14.h))
                      ]),
                      SizedBox(height: 6.v),
                      Text("University Of Ibadan, Ibadan.",
                          style: theme.textTheme.titleMedium),
                      SizedBox(height: 11.v),
                      Container(
                          width: 304.h,
                          margin: EdgeInsets.only(right: 64.h),
                          child: Text(
                              "Evaporation - 16%, Transpiration - 25%\n;ajknfprg ;erjklnpoer ;elrkjnneb ;wekjrbvjwer ;ekjrv",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.labelLarge)),
                      SizedBox(height: 35.v),
                      SizedBox(
                          height: 478.v,
                          width: 368.h,
                          child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgMapOfBirmingham,
                                    height: 478.v,
                                    width: 368.h,
                                    radius: BorderRadius.circular(15.h),
                                    alignment: Alignment.center),
                                Align(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              height: 15.v,
                                              width: 121.h,
                                              child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                            height: 15.v,
                                                            width: 121.h,
                                                            decoration: BoxDecoration(
                                                                color: appTheme
                                                                    .gray100Cc))),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Text(
                                                            "Map data @2019 Google",
                                                            style: CustomTextStyles
                                                                .bodySmallRobotoBlack900))
                                                  ])),
                                          Container(
                                              width: 70.h,
                                              margin:
                                                  EdgeInsets.only(left: 1.h),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.h,
                                                  vertical: 1.v),
                                              decoration:
                                                  AppDecoration.fillGrayCc,
                                              child: Text("Terms of Use",
                                                  style: CustomTextStyles
                                                      .bodySmallRobotoBlack900)),
                                          Container(
                                              height: 15.v,
                                              width: 94.h,
                                              margin:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                            height: 15.v,
                                                            width: 94.h,
                                                            decoration: BoxDecoration(
                                                                color: appTheme
                                                                    .gray100Cc))),
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Text(
                                                            "Report a map error",
                                                            style: CustomTextStyles
                                                                .bodySmallRobotoBlack900))
                                                  ]))
                                        ])),
                                CustomImageView(
                                    imagePath: ImageConstant.imgSettings,
                                    height: 19.v,
                                    width: 61.h,
                                    alignment: Alignment.bottomLeft,
                                    margin: EdgeInsets.only(
                                        left: 7.h, bottom: 3.v)),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        height: 28.adaptSize,
                                        width: 28.adaptSize,
                                        margin: EdgeInsets.only(
                                            top: 69.v, right: 8.h),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h, vertical: 4.v),
                                        decoration: AppDecoration
                                            .outlineBlack900
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder2),
                                        child: CustomImageView(
                                            imagePath: ImageConstant
                                                .imgPegmanOffscreen2x,
                                            height: 20.v,
                                            width: 12.h,
                                            alignment: Alignment.center))),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        height: 53.v,
                                        width: 28.h,
                                        margin: EdgeInsets.only(
                                            top: 8.v, right: 8.h),
                                        decoration: BoxDecoration(
                                            color: appTheme.whiteA700,
                                            borderRadius:
                                                BorderRadius.circular(2.h),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: appTheme.black900
                                                      .withOpacity(0.2),
                                                  spreadRadius: 2.h,
                                                  blurRadius: 2.h,
                                                  offset: Offset(0, 1))
                                            ]))),
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 336.h,
                                            top: 16.v,
                                            right: 12.h),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgUnion,
                                                  height: 10.adaptSize,
                                                  width: 10.adaptSize),
                                              SizedBox(height: 8.v),
                                              Container(
                                                  height: 1.v,
                                                  width: 20.h,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          appTheme.gray30001)),
                                              SizedBox(height: 12.v),
                                              Container(
                                                  height: 2.v,
                                                  width: 10.h,
                                                  decoration: BoxDecoration(
                                                      color: theme.colorScheme
                                                          .primaryContainer))
                                            ]))),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            8.h, 8.v, 266.h, 441.v),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.h),
                                        decoration: AppDecoration
                                            .outlineBlack900
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder2),
                                        child: Row(children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8.v, bottom: 7.v),
                                              child: Text("Map",
                                                  style: theme
                                                      .textTheme.labelMedium)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.h),
                                              child: SizedBox(
                                                  height: 29.v,
                                                  child: VerticalDivider(
                                                      width: 1.h,
                                                      thickness: 1.v))),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 7.h,
                                                  top: 7.v,
                                                  bottom: 7.v),
                                              child: Text("Satellite",
                                                  style: CustomTextStyles
                                                      .bodySmallRobotoGray700))
                                        ])))
                              ])),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 60.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgPolygon4,
            margin: EdgeInsets.only(left: 30.h, top: 18.v, bottom: 17.v)),
        title: AppbarTitle(
            text: "Evapotranspiration", margin: EdgeInsets.only(left: 8.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgMaterialSymbolsSort,
              margin: EdgeInsets.symmetric(horizontal: 30.h, vertical: 17.v))
        ],
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildTwenty(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text("Yesterday, 05-06-2022", style: theme.textTheme.bodySmall),
      Text("08:00 AM", style: theme.textTheme.bodySmall)
    ]);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
