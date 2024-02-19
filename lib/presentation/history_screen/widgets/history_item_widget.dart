import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';

// ignore: must_be_immutable
class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Yesterday, 05-06-2022",
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(height: 5.v),
            Row(
              children: [
                Text(
                  "80 mm/d",
                  style: theme.textTheme.titleMedium,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgPolygon4,
                  height: 12.adaptSize,
                  width: 12.adaptSize,
                  margin: EdgeInsets.only(
                    left: 5.h,
                    top: 3.v,
                    bottom: 4.v,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.v),
            Text(
              "University Of Ibadan, Ibadan.",
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 26.v,
            bottom: 17.v,
          ),
          child: Text(
            "08:00 AM",
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
