import 'package:buenos_transportation/globalWidgets/textWidget/text_widget.dart';
import 'package:buenos_transportation/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:buenos_transportation/screens/home/bookAtripTab/book_a_trip_tab.dart';
import 'package:buenos_transportation/screens/home/homeTab/home_tab.dart';
import 'package:buenos_transportation/screens/home/travelInfo/travel_info.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contactUs/contact_us.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    var provData = Provider.of<StateSettingProvider>(context);
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: bottomNavigationBar(screenWidth),
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          drawer: Drawer(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: theme.blueColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 5.5, top: screenWidth * 5.5),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SizedBox(
                        height: screenWidth * 4.5,
                        width: screenWidth * 4.5,
                        child: Image.asset(
                          'assets/vertical_drawer.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth * 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      provData.showHome();
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: screenWidth * 10),
                          alignment: Alignment.centerLeft,
                          height: screenWidth * 13,
                          width: double.infinity,
                          color: Colors.white,
                          child:
                              text('HOME', screenWidth * 3.7, theme.blueColor),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectedIndex = 1;
                      Navigator.of(context).pop();
                      provData.showBookAtrip();
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: screenWidth * 10),
                          alignment: Alignment.centerLeft,
                          height: screenWidth * 13,
                          width: double.infinity,
                          child: text(
                              'BOOK A TRIP', screenWidth * 3.7, Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 10),
                          height: 1,
                          width: double.infinity,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectedIndex = 1;
                      Navigator.of(context).pop();
                      provData.showTravelinfo();
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: screenWidth * 10),
                          alignment: Alignment.centerLeft,
                          height: screenWidth * 13,
                          width: double.infinity,
                          child: text(
                              'TRAVEL INFO', screenWidth * 3.7, Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 10),
                          height: 1,
                          width: double.infinity,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _selectedIndex = 1;
                      Navigator.of(context).pop();
                      provData.showContactUs();
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: screenWidth * 10),
                          alignment: Alignment.centerLeft,
                          height: screenWidth * 13,
                          width: double.infinity,
                          child: text(
                              'CONTACT US', screenWidth * 3.7, Colors.white),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenWidth * 10),
                          height: 1,
                          width: double.infinity,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: screenWidth * 17,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(screenWidth * 4),
                    bottomRight: Radius.circular(screenWidth * 4))),
            iconTheme: IconThemeData(color: theme.blueColor),
            title: provData.homeSelected
                ? Image.asset(
                    'assets/buenos_logo.png',
                    fit: BoxFit.contain,
                    height: screenWidth * 11,
                    width: screenWidth * 11,
                  )
                : provData.bookATripSelected
                    ? text('Book A Trip', screenWidth * 4, theme.blueColor)
                    : provData.travelInfoSelected
                        ? text('Travel Info', screenWidth * 4, theme.blueColor)
                        : provData.contactUsSelected
                            ? text(
                                'Contact Us', screenWidth * 4, theme.blueColor)
                            : SizedBox(),
          ),
          body: provData.homeSelected
              ? HomeTab()
              : provData.bookATripSelected
                  ? BookATripTab()
                  : provData.travelInfoSelected
                      ? TravelInfo()
                      : provData.contactUsSelected
                          ? ContactUs()
                          : Container()),
    );
  }

  Widget bottomNavigationBar(screenWidth) {
    return SizedBox(
      height: screenWidth * 15,
      child: BottomNavigationBar(
          selectedFontSize: 15,
          // unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              if (_selectedIndex == 0) {
                Provider.of<StateSettingProvider>(context, listen: false)
                    .showHome();
              }
              if (_selectedIndex == 1) {
                Provider.of<StateSettingProvider>(context, listen: false)
                    .showBookAtrip();
              }
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: theme.blueColor,
          unselectedItemColor: Colors.grey.shade500,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: screenWidth * 3, fontWeight: FontWeight.w600),
                ),
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/home_icon.png',
                    color: _selectedIndex == 0
                        ? theme.blueColor
                        : Colors.grey.shade500,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                title: Text(
                  'Book',
                  style: TextStyle(
                      fontSize: screenWidth * 3, fontWeight: FontWeight.w600),
                ),
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/book_icon.png',
                    color: _selectedIndex == 1
                        ? theme.blueColor
                        : Colors.grey.shade500,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                title: Text(
                  'Track',
                  style: TextStyle(
                      fontSize: screenWidth * 3, fontWeight: FontWeight.w600),
                ),
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/track_icon.png',
                    color: _selectedIndex == 2
                        ? theme.blueColor
                        : Colors.grey.shade500,
                    fit: BoxFit.contain,
                  ),
                )),
            BottomNavigationBarItem(
                title: Text(
                  'Trips',
                  style: TextStyle(
                      fontSize: screenWidth * 3, fontWeight: FontWeight.w600),
                ),
                icon: SizedBox(
                  height: screenWidth * 5.3,
                  width: screenWidth * 5.3,
                  child: Image.asset(
                    'assets/trips_icon.png',
                    color: _selectedIndex == 3
                        ? theme.blueColor
                        : Colors.grey.shade500,
                    fit: BoxFit.contain,
                  ),
                )),
          ]),
    );
  }
}
