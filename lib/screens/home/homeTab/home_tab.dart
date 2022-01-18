import 'package:buenos_transportation/globalWidgets/textWidget/text_widget.dart';
import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 6),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                image: AssetImage('assets/home_background.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: screenWidth * 17),
              child: Row(
                children: [
                  SizedBox(
                    height: screenWidth * 5,
                    width: screenWidth * 5,
                    child: Image.asset(
                      'assets/law_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 2),
                      child: text(
                        'Federal Law requires masks be worn on board the bus and at our facilities',
                        screenWidth * 3,
                        Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 3.5,
                    width: screenWidth * 3.5,
                    child: Image.asset(
                      'assets/close_icon.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                text('Welcome to', screenWidth * 5, Colors.white),
                SizedBox(
                  height: screenWidth * 2,
                ),
                text('BUENO EXPRESS', screenWidth * 8, theme.redColor,
                    fontWeight: FontWeight.w700,
                    shadowColor: Colors.white30,
                    blurRadius: 1.2),
                text('TRANSPORTATION', screenWidth * 8, theme.blueColor,
                    fontWeight: FontWeight.w700,
                    shadowColor: Colors.white30,
                    blurRadius: 1.2),
              ],
            ),
            SizedBox(
              height: screenWidth * 11,
              width: screenWidth * 50,
              child: RaisedButton(
                  onPressed: () {},
                  color: theme.blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 70)),
                  child: text('Book A Trip', screenWidth * 3.6, Colors.white,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox()
          ],
        ));
  }
}
