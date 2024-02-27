import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/data/weatherdata.dart';
import 'package:habib_s_application5/models/weathermodel.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_leading_image.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:habib_s_application5/widgets/app_bar/appbar_trailing_image.dart';
import 'package:habib_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:habib_s_application5/widgets/customAlerDialog.dart';
import 'package:habib_s_application5/widgets/custom_elevated_button.dart';
import 'package:habib_s_application5/widgets/custom_text_form_field.dart';

class ManualCalculationScreen extends StatefulWidget {
  ManualCalculationScreen({Key? key})
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

  Future<void> _fetchWeatherData(String cityName) async {
    try {
      WeatherData weatherData = await fetchWeatherData(7.3611, 3.868);
      print("hey");
      print(weatherData);
      print(weatherData.main!.temp);
      print(weatherData.wind!.speed);
      print(weatherData.main!.humidity);
      print(weatherData.main!.pressure);

      // var temperature =
      //     convertToDegreeCelcius(weatherData.main!.temp!);

      setState(() {
        weatherData = weatherData;
//convert airtempertaure to celsius

        //   print("Temperature: $temperature");
        print("Wind Speed: ${weatherData.wind!.speed}");
        print(
            "slopeOfVaporPressureCurve: ${slopeVapourPressureCurve(weatherData.main!.temp!)}");

        // Set text controller values

        //convertairtemperaturefrom kelvin to celsius

        var airTempertaure = convertToDegreeCelcius(weatherData.main!.temp!);

        airTemperatureController.text = airTempertaure.toString();

        windSpeedController.text = weatherData.wind!.speed.toString();

        psychrometricConstantController.text = '0.067';

        slopeOfVaporPressureCurveController.text =
            slopeVapourPressureCurve(weatherData.main!.temp!).toString();

        actualVaporPressureController.text = actualVapourPressure(
                weatherData.main!.temp!, weatherData.main!.humidity!)
            .toString();

        saturationVaporPressureController.text =
            saturationVaporPressure(weatherData.main!.temp!).toString();

        soilHeatFluxController.text = '0';

        meanAirTemperature.text = meanAirTemperatureCalculation(
                weatherData.main!.tempMax!, weatherData.main!.tempMin!)
            .toString();

        netRadiationController.text = "10";
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  calculateEvapotranspiration(
    netRadiation, // MJ/m² day
    soilHeatFlux, // MJ/m² day
    meanAirTemperature, // °C
    windSpeed, // m/s
    saturationVaporPressure, // kPa
    actualVaporPressure, // kPa
    slopeVaporPressureCurve, // kPa/°C
    psychrometricConstant,
  ) {
    double vaporPressureDeficit = saturationVaporPressure - actualVaporPressure;

    double numerator = slopeVaporPressureCurve * netRadiation +
        psychrometricConstant * (vaporPressureDeficit * windSpeed);

    double denominator = slopeVaporPressureCurve +
        ((psychrometricConstant * 1.6) * vaporPressureDeficit);

    // Calculate reference evapotranspiration
    double eto = (numerator / denominator) *
        ((0.408 *
                saturationVaporPressure *
                longwaveRadiation(meanAirTemperature) +
            netRadiation +
            soilHeatFlux)) /
        (psychrometricConstant * (1 + 0.34 * windSpeed));

    print("Eto: $eto");

    return eto;
  }

  // Helper function for longwave radiation calculation
  double longwaveRadiation(double airTemperature) {
    return 4.903 * math.pow(10, -9) * math.pow(airTemperature + 273.15, 4);
  }

  slopeVapourPressureCurve(double temperature) {
    double temperatureCelsius = temperature - 273.15;
    return 4098 *
        (0.6108 *
            exp((17.27 * temperatureCelsius) / (temperatureCelsius + 237.3))) /
        pow(temperature + 237.3, 2);
  }

  double actualVapourPressure(
      double temperatureFahrenheit, int relativeHumidity) {
    // Convert temperature from Kelvin to Celsius
    double temperatureCelsius = temperatureFahrenheit - 273.15;

    return (0.6108 *
            exp((17.27 * temperatureCelsius) / (temperatureCelsius + 237.3))) *
        (relativeHumidity / 100);
  }

  double saturationVaporPressure(double temperatureFahrenheit) {
    // Convert temperature to Celsius
    double temperatureCelsius = temperatureFahrenheit - 273.15;

    return 0.6108 *
        exp((17.27 * temperatureCelsius) / (temperatureCelsius + 237.3));
  }

  double meanAirTemperatureCalculation(
      double airTemperature, double meanTemperature) {
    // double airTemperatures = double.parse(airTemperature);
    // double meanTemperature = double.parse(meanAirTemperature.text);

    // Convert temperatures to Celsius
    double airTemperatureCelsius = airTemperature - 273.15;
    double meanTemperatureCelsius = meanTemperature - 273.15;

    return (airTemperatureCelsius + meanTemperatureCelsius) / 2;
  }

  // netRadiationCalculation() {
  //   return double.parse(_weatherData!.main.);
  // }

  @override
  void initState() {
    super.initState();
    print("Latitude: ${weatherData?.coord!.lat}");
    //  print("Latitude: ${weatherData.lat}");
    _fetchWeatherData("ibadan");
    // print('Latitude: ${_weatherData?.main.tempMax}');
  }

  @override
  Widget build(BuildContext context) {
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

              FutureBuilder(
                  future: _fetchWeatherData("Ibadan"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.h,
                            vertical: 31.v,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Net Radiation",
                                    style: theme.textTheme.headlineSmall),
                                _buildDegreesCounter(context),
                                SizedBox(height: 31.v),
                                Text("Soil Heat Flux",
                                    style: theme.textTheme.headlineSmall),
                                _buildMinimumTemperature1(context),
                                SizedBox(height: 31.v),
                                // Text("Mean Air Temperature",
                                //     style: theme.textTheme.headlineSmall),
                                // _buildSolarRadiation(context),
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
                                      "${weatherData?.coord!.lat}, ${weatherData?.coord!.lat}",
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
                                    "Evaporation - %, Transpiration - 25%\n;ajknfprg ;erjklnpoer ;elrkjnneb ;wekjrbvjwer ;ekjrv",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                                SizedBox(height: 5.v),
                              ],
                            ),
                          ));
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error fetching weather data'),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container();
                  }),
          bottomNavigationBar: _buildNinety(context),
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
  Widget _buildSolarRadiation(BuildContext context) {
    return CustomTextFormField(
      controller: airTemperatureController,
      hintText: "Mean Air Temperature",
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
    return CustomElevatedButton(
      height: 45.v,
      text: "Calculate",
      buttonStyle: CustomButtonStyles.fillPrimary,
      buttonTextStyle: CustomTextStyles.titleSmallMedium,
      onPressed: () {
        // print(double.tryParse(netRadiationController.text));
        // print(double.tryParse(soilHeatFluxController.text));
        // print(double.tryParse(meanAirTemperature.text));
        // print(double.tryParse(windSpeedController.text));
        // print(double.tryParse(saturationVaporPressureController.text));
        // print(double.tryParse(actualVaporPressureController.text));
        // print(double.tryParse(slopeOfVaporPressureCurveController.text));
        // print(double.tryParse(psychrometricConstantController.text));

        //    calculateEvapotranspiration(
        //       12.00,
        //       13.00,
        //  14.00,
        //     15555.00,
        //   454443.00,
        //      123454.00,
        //       2222.00,
        //  22222.00);

        var value = calculateEvapotranspiration(
            double.tryParse(netRadiationController.text),
            double.tryParse(soilHeatFluxController.text),
            double.tryParse(airTemperatureController.text),
            double.tryParse(windSpeedController.text),
            double.tryParse(saturationVaporPressureController.text),
            double.tryParse(actualVaporPressureController.text),
            double.tryParse(slopeOfVaporPressureCurveController.text),
            double.tryParse(psychrometricConstantController.text));

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomAlertDialog(
              title: "Your Evapotranspiration is:",
              content: "${value.toString()}",
              positiveButtonText: "Yes",
              negativeButtonText: "No",
              onPositiveButtonPressed: () {
                print("Yes");
                Navigator.of(context).pop(); // Close the dialog
              },
              onNegativeButtonPressed: () {
                print("No");
                Navigator.of(context).pop(); // Close the dialog
              },
            );
          },
        );

        // Future.delayed(Duration(seconds: 5), () {
        //  Navigator.pushNamed(context, AppRoutes.historyDetailsScreen);
        // });
      },
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

convertToDegreeCelcius(double text) {
  double kelvin = text;

  double celsius = kelvin - 273.15;
  // double celsius = (fahrenheit - 32) * (5 / 9);
  return celsius;
}
