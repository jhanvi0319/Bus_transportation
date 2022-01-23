import 'dart:convert';

import 'package:buenos_transportation/globalWidgets/textWidget/text_widget.dart';
import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SelectDeparture extends StatefulWidget {
  final String? cityFromData;
  final String? cityToData;
  final String? selectedDateDeparture;

  const SelectDeparture(
      {Key? key,
        this.cityFromData,
        this.cityToData,
        this.selectedDateDeparture
      }) : super(key: key);

  @override
  _SelectDepartureState createState() => _SelectDepartureState();
}

class _SelectDepartureState extends State<SelectDeparture> {
  int _selectedIndex = 1;
  int focusedDateBlock = 1;
  String resultFetch = 'fetching';
  String fromCity = '';
  String toCity = '';
  String date = '';
  var buses = [];


  @override
  void initState() {
    super.initState();
    fetchSearchBuses();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    if (resultFetch == 'fetching') {
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else if (resultFetch == 'failed') {
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        // make pop action to next cycle
        Navigator.pop(context);
      });
    } else {
      return SafeArea(
        child: Scaffold(
          // bottomNavigationBar: bottomNavigationBar(screenWidth),
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            appBar: appBar(screenWidth),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 6, screenWidth * 6, screenWidth * 6, 0),
              color: theme.blueColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth * 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        text(fromCity, screenWidth * 3.3, Colors.white,
                            fontWeight: FontWeight.w600),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: screenWidth * 4,
                        ),
                        text(toCity, screenWidth * 3.3, Colors.white,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    dateSelection(screenWidth),
                    SizedBox(
                      height: screenWidth * 4,
                    ),
                    for (int i = 0; i < buses.length; i++)
                      detailsBlock(screenWidth, buses[i])
                  ],
                ),
              ),
            )),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget bottomNavigationBar(screenWidth) {
    return SizedBox(
      height: screenWidth * 15,
      child: BottomNavigationBar(
          selectedFontSize: 15,
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
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

  AppBar appBar(screenWidth) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: theme.blueColor,
            size: screenWidth * 5,
          )),
      centerTitle: true,
      toolbarHeight: screenWidth * 17,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(screenWidth * 4),
              bottomRight: Radius.circular(screenWidth * 4))),
      iconTheme: IconThemeData(color: theme.blueColor),
      title: text('Select Departure', screenWidth * 4, theme.blueColor),
    );
  }

  Widget dateSelection(screenWidth) {
    return SizedBox(
      height: screenWidth * 34,
      width: double.infinity,
      child: PageView.builder(
          controller: PageController(
            viewportFraction: .34,
            initialPage: 1,
          ),
          onPageChanged: (value) {
            setState(() {
              focusedDateBlock = value;
            });
          },
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: focusedDateBlock == index
                      ? Colors.white
                      : Colors.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(screenWidth * 3)),
              margin: EdgeInsets.symmetric(
                  vertical: focusedDateBlock == index ? 0 : screenWidth * 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  text(
                      'Sun Oct 31',
                      screenWidth * 4,
                      focusedDateBlock == index
                          ? theme.blueColor
                          : Colors.white,
                      fontWeight: FontWeight.w600),
                  text(
                    'From',
                    screenWidth * 3.6,
                    focusedDateBlock == index ? theme.blueColor : Colors.white,
                  ),
                  text(
                    '\$ 191',
                    screenWidth * 3.8,
                    focusedDateBlock == index ? theme.blueColor : Colors.white,
                  )
                ],
              ),
            );
          }),
    );
  }

  Widget detailsBlock(screenWidth, bus) {
    String localDestTime = bus["departure_time"];
    String localArrTime = bus["arrival_time"];
    var destTimeArray = localDestTime.split(":");
    var arrTimeArray = localArrTime.split(":");
    var destAMPM =
    destTimeArray[2].replaceAll(new RegExp(r'\d'), '').toUpperCase();
    var arrAMPM =
    arrTimeArray[2].replaceAll(new RegExp(r'\d'), '').toUpperCase();

    List<DropdownMenuItem<String>> classList = [];

    return Container(
      margin: EdgeInsets.only(bottom: screenWidth * 3),
      padding: EdgeInsets.all(screenWidth * 2),
      height: screenWidth * 54,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(screenWidth * 2),
          color: Colors.white),
      child: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            screenWidth * 2, screenWidth * 2, screenWidth * 2, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                        'Departure', screenWidth * 3.2, theme.blueColor,
                                        fontWeight: FontWeight.w400),

                                    text(
                                        (destTimeArray[0] +
                                            ":" +
                                            destTimeArray[1] +
                                            destAMPM),
                                        screenWidth * 4.2,
                                        Colors.grey.shade800,
                                        fontWeight: FontWeight.w700),
                                    // DateFormat('hh:mm:ss').format(DateTime.now());
                                    text(date, screenWidth * 2.3, theme.blueColor,
                                        fontWeight: FontWeight.w400),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text('Arrival', screenWidth * 3.2, theme.blueColor,
                                        fontWeight: FontWeight.w400),
                                    text(
                                        (arrTimeArray[0] +
                                            ":" +
                                            arrTimeArray[1] +
                                            arrAMPM),
                                        // text(DateFormat('h:mm a').format(
                                        //     DateTime.parse(bus["arrival_time"])),
                                        screenWidth * 4.2,
                                        Colors.grey.shade800,
                                        fontWeight: FontWeight.w700),
                                    text(date, screenWidth * 2.3, theme.blueColor,
                                        fontWeight: FontWeight.w400),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: screenWidth * 3),
                            text(bus["duration"], screenWidth * 2.4,
                                Colors.grey.shade800,
                                fontWeight: FontWeight.w400),
                            SizedBox(height: screenWidth * 2),
                            text('2 Transfers', screenWidth * 2.4, theme.blueColor,
                                fontWeight: FontWeight.w400),
                            text(bus["route_name"], screenWidth * 2.4, theme.blueColor,
                                fontWeight: FontWeight.w400),
                            SizedBox(height: screenWidth * 3),
                            Row(
                              children: [
                                SizedBox(
                                  height: screenWidth * 4,
                                  width: screenWidth * 4,
                                  child: Image.asset(
                                    'assets/wifi_icon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: screenWidth),
                                SizedBox(
                                  height: screenWidth * 3.7,
                                  width: screenWidth * 3.7,
                                  child: Image.asset(
                                    'assets/switch_icon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: screenWidth),
                                SizedBox(
                                  height: screenWidth * 3.7,
                                  width: screenWidth * 3.7,
                                  child: Image.asset(
                                    'assets/seat_icon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),

                  Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: EdgeInsets.all(screenWidth * 3),
                          margin: EdgeInsets.all(3),
                          height: screenWidth * 28,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: theme.redColor,
                              borderRadius: BorderRadius.circular(screenWidth * 3)),
                          child: InkWell(
                            onTap: (){},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(bus["tickets_dropdown"][0]["ticket"], screenWidth * 3.5, Colors.white,
                                    fontWeight: FontWeight.w400),
                                text('Average Fare / person', screenWidth * 2.3,
                                    Colors.white,
                                    fontWeight: FontWeight.w400),
                                text('\$'+bus["tickets_dropdown"][0]["price"], screenWidth * 5, Colors.white,
                                    fontWeight: FontWeight.w500),
                                Spacer(),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      text('View All Fares', screenWidth * 2.3,
                                          Colors.white,
                                          fontWeight: FontWeight.w400),
                                      SizedBox(
                                        height: screenWidth * 3,
                                        width: screenWidth * 3,
                                        child: Image.asset(
                                          'assets/expand_arrow_down_icon.png',
                                          fit: BoxFit.contain,
                                          color: Colors.white,
                                        ),
                                      )
                                    ])
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              )),
          SizedBox(
            height: screenWidth * 7,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
                    color: Colors.grey.shade500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 70)),
                    child: text('VIEW DETAILS', screenWidth * 2.2, Colors.white,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  width: screenWidth,
                ),
                RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
                    color: theme.blueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 70)),
                    child: text('BOOK DETAILS', screenWidth * 2.2, Colors.white,
                        fontWeight: FontWeight.w500))
              ],
            ),
          )
        ],
      ),
    );
  }

  void fetchSearchBuses() async {
    try{
      var bodyData = {
        "pickup_id" : widget.cityToData,
        "return_id" : widget.cityFromData,
        "date" : widget.selectedDateDeparture
      };
      var response = await http.post(Uri.parse("https://buenoexpresstransport.com/admin/index.php?controller=pjAPI&action=GetBusListAPI"),body: bodyData);
      var jsonData = jsonDecode(response.body);
      if (jsonData == null) {
        setState(() {
          resultFetch = 'failed';
        });
      } else {
        if (jsonData["code"] == 100) {
          setState(() {
            resultFetch = 'failed';
            //alert no Buses found
          });
        }
        var fromCityLocal = '';
        var toCityLocal = '';
        String departureTime = '';
        for (var bus in jsonData["buses_list"]) {
          fromCityLocal = bus["from_location"];
          toCityLocal = bus["to_location"];
          break;
        }
        setState(() {
          fromCity = fromCityLocal;
          toCity = toCityLocal;
          resultFetch = 'success';
          buses = jsonData["buses_list"];
          date = DateFormat('EEEE, d MMM')
              .format(DateFormat('dd-MM-yyyy').parse(jsonData["date"]));
        });
      }
    }
    catch(ex){
      setState(() {
        resultFetch = 'failed';
      });
    }
  }

}
