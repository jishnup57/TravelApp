import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_aliga/app/utils/colors.dart';
class AppStyle{
static const kWlcomeLarge =
    TextStyle(color: AppColor.kBlackColor, fontSize: 50, fontWeight: FontWeight.w900);

static const kWlcomeMedium =
    TextStyle(color: AppColor.kSecondaryColor, fontSize: 40, fontWeight: FontWeight.normal);
static const kWelcomeSmall= TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: AppColor.kSecondaryColor);
static final kStartButtonText =
    TextStyle(color: Colors.grey.shade50, fontSize: 20, fontWeight: FontWeight.w400);
static final kAppBarTextStyle =
      TextStyle(color: AppColor.kBlackColor, fontSize: 30, fontWeight: FontWeight.w600,fontFamily: GoogleFonts.poppins().fontFamily);
static final kCardTextStyle =
     TextStyle(color: AppColor.kWhiteColor, fontSize: 22, fontWeight: FontWeight.w300,fontFamily: GoogleFonts.poppins().fontFamily);
static const kTabStyle=TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
static const kIntermediateText= TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: AppColor.kSecondaryColor);
 static final kLoginIntermedText=TextStyle(color: AppColor.kBlackColor,fontSize: 16,fontWeight: FontWeight.bold,fontFamily: GoogleFonts.ubuntu().fontFamily);
static const kHight20 = SizedBox(height: 20);
static const kHight10 = SizedBox(height: 10);
static const kHight8 = SizedBox(height: 6);
static const kWidth = SizedBox(width: 8);
}