import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rymckiosk/common/resources/app_color.dart';
import 'package:sizer/sizer.dart';

ThemeData get applicationTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldColor,

      /// Main Color

      primaryColor: AppColors.mainApp,
      primaryColorLight: AppColors.lightBlue,
      primaryColorDark: Colors.black,
      disabledColor: Colors.grey,

      /// CardViewTheme

      cardTheme: const CardTheme(),

      /// AppBar Theme
      appBarTheme: AppBarTheme(
          backgroundColor: AppColors.scaffoldColor,
          elevation: 0,
          titleTextStyle: GoogleFonts.tajawal(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.secondary)),

      /// Button Theme
      buttonTheme: const ButtonThemeData(),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle?>(
            GoogleFonts.tajawal(
              fontSize: 15.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),

      /// Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(35.w, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: GoogleFonts.tajawal(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppColors.mainApp,
        ),
      ),

      /// Text Theme

      textTheme: TextTheme(
        //
        headlineLarge: GoogleFonts.tajawal(
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),

        headlineMedium: GoogleFonts.tajawal(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        headlineSmall: GoogleFonts.tajawal(
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        labelLarge: GoogleFonts.tajawal(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        labelMedium: GoogleFonts.tajawal(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        labelSmall: GoogleFonts.tajawal(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.tajawal(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        bodySmall: GoogleFonts.tajawal(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),

      /// Input Decoration Theme (text form filed)
    );
