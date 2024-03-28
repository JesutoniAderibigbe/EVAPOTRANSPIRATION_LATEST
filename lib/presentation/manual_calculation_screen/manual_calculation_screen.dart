import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/models/provider/location_provider.dart';
import 'package:habib_s_application5/models/provider/weather_data_provider.dart';
import 'package:habib_s_application5/models/weathermodel.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_leading_image.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_trailing_image.dart';
import 'package:habib_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:habib_s_application5/widgets/custom_elevated_button.dart';
import 'package:habib_s_application5/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class ManualCalculationScreen extends StatefulWidget {
  final double? longitude;
  final double? latitude;
  ManualCalculationScreen({Key? key, this.latitude, this.longitude})
      : super(
          key: key,
        );

  @override
  State<ManualCalculationScreen> createState() =>
      _ManualCalculationScreenState();
}

class _ManualCalculationScreenState extends State<ManualCalculationScreen> {
  TextEditingController netRadiationController = TextEditingController();
  TextEditingController soilHeatFluxController = TextEditingController();
  TextEditingController airTemperatureController = TextEditingController();
  TextEditingController windSpeedController = TextEditingController();
  TextEditingController saturationVaporPressureController =
      TextEditingController();
  TextEditingController actualVaporPressureController = TextEditingController();
  TextEditingController slopeOfVaporPressureCurveController =
      TextEditingController();
  TextEditingController psychrometricConstantController =
      TextEditingController();
  TextEditingController resultController = TextEditingController();
  TextEditingController meanAirTemperature = TextEditingController();

  WeatherData? weatherData;

  late double width;

  @override

void initState() {
  super.initState();


    final locationProvider = Provider.of<LocationProvider>(context, listen: false);
    
    _fetchWeatherData();
  
}


 void _fetchWeatherData() {
    final locationProvider = Provider.of<LocationProvider>(context, listen: false);
    
    Provider.of<WeatherDataProvider>(context, listen: false).fetchWeatherDatas(
  7.223456,
    3.1234566,
      airTemperatureController,
      windSpeedController,
      psychrometricConstantController,
      slopeOfVaporPressureCurveController,
      actualVaporPressureController,
      saturationVaporPressureController,
      soilHeatFluxController,
      meanAirTemperature,
      netRadiationController,
    );
  }


  @override
  void dispose() {
 netRadiationController.dispose();
  soilHeatFluxController.dispose();
  airTemperatureController.dispose();
  windSpeedController.dispose();
  saturationVaporPressureController.dispose();
  actualVaporPressureController.dispose();
  slopeOfVaporPressureCurveController.dispose();
  psychrometricConstantController.dispose();
  resultController.dispose();
  meanAirTemperature.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final locationProvider =
        Provider.of<LocationProvider>(context, listen: false);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _buildAppBar(context),
          body:

              //Text("Hi"),

              Consumer<WeatherDataProvider>(
            builder: (context, weatherProvider, _) {
              if (weatherProvider.weatherData == null) {
                return Center(child: Text("No data available"));
              } else if (weatherProvider.weatherData != null) {
                return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus();
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.h,
                      vertical: 31.v,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 31.v),
                          Text("Net Radiation",
                              style: theme.textTheme.headlineSmall),
                          _buildDegreesCounter(context),
                          SizedBox(height: 31.v),
                          Text("Soil Heat Flux",
                              style: theme.textTheme.headlineSmall),
                          _buildMinimumTemperature1(context),
                          SizedBox(height: 31.v),
                          Text("Wind Speed",
                              style: theme.textTheme.headlineSmall),
                          _buildMinimumTemperature2(context),
                          SizedBox(height: 31.v),
                          Text("Saturation Vapor Pressure",
                              style: theme.textTheme.headlineSmall),
                          _buildMinimumTemperature3(context),
                          SizedBox(height: 31.v),
                          Text("Actual Vapor Pressure",
                              style: theme.textTheme.headlineSmall),
                          _buildMinimumTemperature4(context),
                          SizedBox(height: 31.v),
                          Text("Slope of Vapor Pressure Curve",
                              style: theme.textTheme.headlineSmall),
                          _buildMinimumTemperature5(context),
                          SizedBox(height: 31.v),
                          Text("Psychrometric Constant",
                              style: theme.textTheme.headlineSmall),
                          _buildMinimumTemperature6(context),
                          SizedBox(
                            height: 31.v,
                          ),
                          Text("Mean Air Temperature",
                              style: theme.textTheme.headlineSmall),
                          _buildMinimumTemperature7(context),
                          SizedBox(height: 31.v),
                          _buildCalculate(context),
                          SizedBox(height: 30.v),
                          Row(
                            children: [
                              Text(
                                "${locationProvider.latitude}, ${locationProvider.longitude}",
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
                          // Add any additional widgets or layout changes here
                        ],
                      ),
                    ),
                  ),
                );
                // Your UI code using weatherProvider.weatherData
              }
              return Text("Hi");
            },
          ),
        ),
        //   bottomNavigationBar: _buildNinety(context),
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
      controller: netRadiationController,
      hintText: "net Radiation",
      hintStyle: theme.textTheme.bodySmall!,
    );
  }

  /// Section Widget
  Widget _buildMinimumTemperature1(BuildContext context) {
    return CustomTextFormField(
      controller: soilHeatFluxController,
      hintText: "Soil Heat Flux",
    );
  }

  /// Section Widget
  Widget _buildMinimumTemperature2(BuildContext context) {
    return CustomTextFormField(
      controller: windSpeedController,
      hintText: "Wind Speed",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildMinimumTemperature3(BuildContext context) {
    return CustomTextFormField(
      controller: saturationVaporPressureController,
      hintText: "Saturation Vapor Pressure",
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildMinimumTemperature4(BuildContext context) {
    return CustomTextFormField(
      controller: actualVaporPressureController,
      hintText: "Saturation Vapor Pressure",
      textInputAction: TextInputAction.done,
      filled: true,
    );
  }

  Widget _buildMinimumTemperature5(BuildContext context) {
    return CustomTextFormField(
      controller: slopeOfVaporPressureCurveController,
      hintText: "Slope of Vapor Pressure Curve",
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildMinimumTemperature6(BuildContext context) {
    return CustomTextFormField(
      controller: psychrometricConstantController,
      hintText: "Psychrometric Constant",
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildMinimumTemperature7(BuildContext context) {
    return CustomTextFormField(
      controller: meanAirTemperature,
      hintText: "Mean Air Temperature",
      textInputAction: TextInputAction.done,
    );
  }

  /// Section Widget
  Widget _buildCalculate(BuildContext context) {
    final weatherProvider = Provider.of<WeatherDataProvider>(context);

    return CustomElevatedButton(
      height: 45.v,
      text: "Calculate",
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallMedium,
      onPressed: () {
        final et = weatherProvider.calculateEvapotranspiration(
          netRadiation: double.parse(netRadiationController.text),
          soilHeatFlux: double.parse(soilHeatFluxController.text),
          meanAirTemperature: double.parse(meanAirTemperature.text),
          windSpeed: double.parse(windSpeedController.text),
          saturationVaporPressure:
              double.parse(saturationVaporPressureController.text),
          actualVaporPressure: double.parse(actualVaporPressureController.text),
          psychrometricConstant:
              double.parse(psychrometricConstantController.text),
        );

        print('Evapotranspiration: ${et.toStringAsFixed(2)} mm/day');

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog.adaptive(
              title: Text("Your Evapotranspiration for your location",
                  style: theme.textTheme.labelSmall),
              content: Text("${et.toStringAsFixed(2)}mm/day"),
              actions: [
                // GestureDetector(
                //   onTap: () {
                //     Navigator.pushNamed(
                //         context, AppRoutes.historyDetailsScreen);
                //   },
                //   child: Text(
                //     "Continue",
                //     style: theme.textTheme.labelSmall,
                //   ),
                // ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok", style: theme.textTheme.labelSmall))
              ],
            );
          },
        );
      },
    );
  }
}

convertToDegreeCelcius(double text) {
  double kelvin = text;

  double celsius = kelvin - 273.15;
  // double celsius = (fahrenheit - 32) * (5 / 9);
  return celsius;
}
