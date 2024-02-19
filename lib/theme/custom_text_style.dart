import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodySmallBluegray900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.blueGray900.withOpacity(0.6),
      );
  static get bodySmallPoppins => theme.textTheme.bodySmall!.poppins;
  static get bodySmallPoppinsPrimary =>
      theme.textTheme.bodySmall!.poppins.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodySmallRobotoBlack900 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.black900.withOpacity(0.8),
        fontSize: 10.fSize,
      );
  static get bodySmallRobotoGray700 =>
      theme.textTheme.bodySmall!.roboto.copyWith(
        color: appTheme.gray700,
        fontSize: 11.fSize,
      );
  // Title text style
  static get titleSmallBluegray900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get montserrat {
    return copyWith(
      fontFamily: 'Montserrat',
    );
  }

  TextStyle get montserratSubrayada {
    return copyWith(
      fontFamily: 'Montserrat Subrayada',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
