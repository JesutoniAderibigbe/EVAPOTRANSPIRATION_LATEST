import '../history_screen/widgets/history_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_leading_image.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_trailing_image.dart';
import 'package:habib_s_application5/widgets/app_bar/custom_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(
            left: 30.h,
            top: 26.v,
            right: 30.h,
          ),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 20.v,
              );
            },
            itemCount: 14,
            itemBuilder: (context, index) {
              return HistoryItemWidget();
            },
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
}
