import 'dart:convert';
import 'package:buenos_transportation/globalWidgets/textWidget/text_widget.dart';
import 'package:buenos_transportation/model/CitiesModel.dart';
import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:buenos_transportation/screens/home/bookAtripTab/Widgets/discount_dropdown.dart';
import 'package:buenos_transportation/screens/home/bookAtripTab/selectDeparture/select_departure.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class BookATripTab extends StatefulWidget {
  const BookATripTab({Key? key}) : super(key: key);

  @override
  State<BookATripTab> createState() => _BookATripTabState();
}

class _BookATripTabState extends State<BookATripTab> {

  @override
  void initState() {
    super.initState();
    fetchToAndFromCities();
  }

  var fromCitiesJson;
  var toCitiesJson;
  int cityFromSelectedId = 0;
  int cityToSelectedId = 0;
  var cityFromSelectedName ;
  var cityToSelectedName ;
  DateTime _dateTime = DateTime.now();
  DateTime _returnDateTime = DateTime.now();
  bool addReturnTripSelected = false;
  bool dateSelected = false;
  List monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 6),
        color: theme.blueColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenWidth * 17,
              ),
              leavingFromField(screenWidth),
              goingToField(screenWidth),
              dateAndReturnFields(screenWidth),
              passengerField(screenWidth),
              DiscountDropDown(),
              promoCodeField(screenWidth),
              SizedBox(
                height: screenWidth * 5,
              ),
              searchButton(screenWidth),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }

  Widget leavingFromField(screenWidth) {
    return Container(
      height: screenWidth * 12.5,
      padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
      margin: EdgeInsets.only(bottom: screenWidth * 3),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 3)),
      child: DropdownButtonHideUnderline(
          child: DropdownButton(
              icon: SizedBox(
                height: screenWidth * 3,
                width: screenWidth * 3,
                child: Image.asset(
                  'assets/location_icon.png',
                  fit: BoxFit.contain,
                ),
              ),
              isExpanded: true,
              style: TextStyle(color: Colors.grey.shade900, fontSize: 13),
              hint: Text(
                  cityFromSelectedId == 0
                      ? 'Leaving From'
                      : cityFromSelectedName,
                  style: TextStyle(
                      color: cityFromSelectedId == 0
                          ? Colors.grey.shade400
                          : Colors.grey.shade800,
                      fontSize: screenWidth * 3.5)),
              onChanged: (val) {
                setState(() {
                  cityFromSelectedId =  int.parse(val.toString());
                  cityFromSelectedName = val;
                });
              },
            value: cityFromSelectedName,

            items: fromCitiesJson?.map<DropdownMenuItem>((item) {
              return new DropdownMenuItem(
                child: new Text(item['name']),
                value: item['id'].toString(),
              );
            }).toList()?? [],
          )),
    );
  }

  Widget goingToField(screenWidth) {
    return Container(
      height: screenWidth * 12.5,
      padding: EdgeInsets.only(left: screenWidth * 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 3)),
      child: TextField(
        style:
        TextStyle(color: Colors.grey.shade800, fontSize: screenWidth * 3.5),
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: SizedBox(
              height: screenWidth * 1,
              width: screenWidth * 3,
              child: Image.asset(
                'assets/location_icon.png',
                fit: BoxFit.contain,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
                minWidth: screenWidth * 10, minHeight: screenWidth * 4),
            hintText: 'Going To',
            hintStyle: TextStyle(
                color: Colors.grey.shade400, fontSize: screenWidth * 3.5)),
      ),
    );
  }

  Widget dateAndReturnFields(screenWidth) {
    return Container(
      height: screenWidth * 15,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: screenWidth * 3),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                onTap: () async {
                  dateSelected = true;
                  DateTime? dateTime;
                  dateTime = await showDatePicker(
                    context: context,
                    initialEntryMode: DatePickerEntryMode.calendar,
                    initialDate: _dateTime,
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2025),
                  );
                  if (dateTime != null) {
                    setState(() {
                      _dateTime = dateTime!;
                    });
                  }
                },
                child: Container(
                    height: screenWidth * 12.5,
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 3),
                    margin:
                    EdgeInsets.only(top: screenWidth * 3, right: screenWidth),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(screenWidth * 3)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${monthNames[_dateTime.month - 1]} ${_dateTime
                                .day},${_dateTime.year}',
                            style: TextStyle(
                                fontSize: screenWidth * 3.3,
                                color: !dateSelected
                                    ? Colors.grey.shade400
                                    : Colors.grey.shade800),
                          ),
                          SizedBox(
                            height: screenWidth * 3.8,
                            width: screenWidth * 3.8,
                            child: Image.asset(
                              'assets/calendar_icon.png',
                              fit: BoxFit.contain,
                            ),
                          )
                        ])),
              )),
          Expanded(
              child: Container(
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              addReturnTripSelected = true;
                            });
                          },
                          child: Container(
                              height: screenWidth * 12.5,
                              padding:
                              EdgeInsets.symmetric(horizontal: screenWidth * 3),
                              margin: EdgeInsets.only(
                                  top: screenWidth * 3, left: screenWidth),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(screenWidth * 3)),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      !addReturnTripSelected
                                          ? 'Add return trip'
                                          : '${monthNames[_returnDateTime
                                          .month - 1]} ${_returnDateTime
                                          .day},${_returnDateTime.year}',
                                      style: TextStyle(
                                          fontSize: screenWidth * 3.3,
                                          color: !addReturnTripSelected
                                              ? Colors.grey.shade400
                                              : Colors.grey.shade800),
                                    ),
                                    !addReturnTripSelected
                                        ? SizedBox()
                                        : GestureDetector(
                                      onTap: () async {
                                        DateTime? dateTime;
                                        dateTime = await showDatePicker(
                                          context: context,
                                          initialEntryMode:
                                          DatePickerEntryMode.calendar,
                                          initialDate: _returnDateTime,
                                          firstDate: DateTime(2015),
                                          lastDate: DateTime(2025),
                                        );
                                        if (dateTime != null) {
                                          setState(() {
                                            _returnDateTime = dateTime!;
                                          });
                                        }
                                      },
                                      child: SizedBox(
                                        height: screenWidth * 3.8,
                                        width: screenWidth * 3.8,
                                        child: Image.asset(
                                          'assets/calendar_icon.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                  ])),
                        )),
                    !addReturnTripSelected
                        ? SizedBox()
                        : GestureDetector(
                      onTap: () {
                        setState(() {
                          addReturnTripSelected = false;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 3),
                        height: screenWidth * 5,
                        width: screenWidth * 5,
                        padding: EdgeInsets.all(screenWidth * 1.4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: theme.redColor, shape: BoxShape.circle),
                        child: Image.asset(
                          'assets/close_icon.png',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget passengerField(screenWidth) {
    return Container(
      height: screenWidth * 12.5,
      padding: EdgeInsets.only(left: screenWidth * 3),
      margin: EdgeInsets.only(bottom: screenWidth * 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 3)),
      child: TextField(
        style:
        TextStyle(color: Colors.grey.shade800, fontSize: screenWidth * 3.5),
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: SizedBox(
              height: screenWidth * 1,
              width: screenWidth * 3,
              child: Image.asset(
                'assets/passenger_icon.png',
                fit: BoxFit.contain,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
                minWidth: screenWidth * 14, minHeight: screenWidth * 4),
            hintText: '1 Passenger',
            hintStyle: TextStyle(
                color: Colors.grey.shade400, fontSize: screenWidth * 3.5)),
      ),
    );
  }

  Widget promoCodeField(screenWidth) {
    return Container(
      height: screenWidth * 12.5,
      padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
      margin: EdgeInsets.only(bottom: screenWidth * 3),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 3)),
      child: TextField(
        style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w700,
            fontSize: screenWidth * 3.5),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Promo code',
            hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * 3.5)),
      ),
    );
  }

  Widget searchButton(screenWidth) {
    return SizedBox(
      height: screenWidth * 12.4,
      width: double.infinity,
      child: RaisedButton(
          onPressed: () {},
          color: theme.redColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 70)),
          child: text('SEARCH', screenWidth * 4, Colors.white,
              fontWeight: FontWeight.w500)),
    );
  }

  void fetchToAndFromCities() async {
    var response = await http
        .get(Uri.parse('https://jsonkeeper.com/b/74GJ'));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      fromCitiesJson = jsonData["From_Buses"];
      toCitiesJson = jsonData["To_Buses"];

    }
    else{
      AlertDialog("Connection Error!");
    }
  }
}
