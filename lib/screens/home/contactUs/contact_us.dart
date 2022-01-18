import 'package:buenos_transportation/globalWidgets/textWidget/text_widget.dart';
import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Container(
        height: double.infinity,
        width: double.infinity,
        color: theme.blueColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenWidth * 23,
              ),
              contactBlock(screenWidth),
              socialsBlock(screenWidth),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }

  Widget contactBlock(screenWidth) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: screenWidth * 8),
          height: screenWidth * 20,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: screenWidth * 5,
                    width: screenWidth * 5,
                    child: Image.asset(
                      'assets/calendar_day_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  text('Monday- Friday', screenWidth * 4.6, Colors.white,
                      fontWeight: FontWeight.w500),
                ],
              ),
              SizedBox(
                height: screenWidth * 1.5,
              ),
              Row(
                children: [
                  SizedBox(
                    height: screenWidth * 4.5,
                    width: screenWidth * 4.5,
                    child: Image.asset(
                      'assets/clock_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  text('5:30AM-9:00PM', screenWidth * 3.7, Colors.white,
                      fontWeight: FontWeight.w500),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: screenWidth * 7,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 8),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: screenWidth * 5.5,
                    width: screenWidth * 5.5,
                    child: Image.asset(
                      'assets/phone_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  text('315-797-1010', screenWidth * 5, Colors.white,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 4,
              ),
              Row(
                children: [
                  SizedBox(
                    height: screenWidth * 5.5,
                    width: screenWidth * 5.5,
                    child: Image.asset(
                      'assets/globe_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  text('www.buenotransit.com', screenWidth * 3.5, Colors.white,
                      fontWeight: FontWeight.w500,
                      textDecoration: TextDecoration.underline)
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 14)
      ],
    );
  }

  Widget socialsBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Socials', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 7,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: screenWidth * 8, right: screenWidth * 2),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: screenWidth * 5.5,
                    width: screenWidth * 5.5,
                    child: Image.asset(
                      'assets/facebook_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  text('https://www.facebook.com/Bueno-Express-Transportation',
                      screenWidth * 2.8, Colors.white,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 4,
              ),
              Row(
                children: [
                  SizedBox(
                    height: screenWidth * 5.5,
                    width: screenWidth * 5.5,
                    child: Image.asset(
                      'assets/instagram_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  text('https://www.instagram.com/bueno_express_transportation',
                      screenWidth * 2.8, Colors.white,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 4,
              ),
              Row(
                children: [
                  SizedBox(
                    height: screenWidth * 5.5,
                    width: screenWidth * 5.5,
                    child: Image.asset(
                      'assets/snapchat_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  text('https://www.snapchat.com/add/buenoexpress',
                      screenWidth * 2.8, Colors.white,
                      fontWeight: FontWeight.w500)
                ],
              ),
              SizedBox(
                height: screenWidth * 4,
              )
            ],
          ),
        ),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }
}
