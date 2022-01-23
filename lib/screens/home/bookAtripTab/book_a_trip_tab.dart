import 'dart:convert';
import 'package:buenos_transportation/globalWidgets/textWidget/text_widget.dart';
import 'package:buenos_transportation/model/CitiesModel.dart';
import 'package:buenos_transportation/model/departure.dart';
import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:buenos_transportation/screens/home/bookAtripTab/Widgets/discount_dropdown.dart';
import 'package:buenos_transportation/screens/home/bookAtripTab/selectDeparture/select_departure.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class BookATripTab extends StatefulWidget {
  const BookATripTab({
    Key? key,
  }) : super(key: key);

  @override
  State<BookATripTab> createState() => _BookATripTabState();
}

class _BookATripTabState extends State<BookATripTab> {
  @override
  void initState() {
    super.initState();
    fetchToAndFromCities();
  }

  List<DropdownMenuItem<String>> fromCitiesList = [];
  List<DropdownMenuItem<String>> toCitiesList = [];
  int cityFromSelectedId = 0;
  int cityToSelectedId = 0;
  var filterBus = [];
  var fromCityLocal = '';
  var toCityLocal = '';
  TextEditingController _date = new TextEditingController();
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
  final _formKey = GlobalKey<FormState>();
  var cityFromSelectedName = null;
  var cityToSelectedName = null;

  _validateForm() {
    bool _isValid = _formKey.currentState!.validate();

    if (cityToSelectedName == null || cityFromSelectedName == null) {
      _isValid = false;
    }

    if (_isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SelectDeparture(
            cityFromData: cityFromSelectedName,
            cityToData: cityToSelectedName,
            selectedDateDeparture: DateFormat("dd-MM-yyyy").format(_dateTime).toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
    return Form(
      key: _formKey,
      child: Container(
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
          )),
    );
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
        child: DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
          ),
          validator: (cityFromSelectedId) {
            if (cityFromSelectedId == null) {
              return "Please select Leaving From City";
            }
            return null;
          },
          value: cityFromSelectedName,
          items: fromCitiesList,
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
          hint: Text('Leaving From',
              style: TextStyle(
                  color: cityFromSelectedId == 0
                      ? Colors.grey.shade400
                      : Colors.grey.shade800,
                  fontSize: screenWidth * 3.5)),
          onChanged: (val) {
            setState(() {
              cityFromSelectedId = int.parse(val.toString());
              cityFromSelectedName = val;
            });
          },
        ),
      ),
    );
  }

  Widget goingToField(screenWidth) {
    return Container(
      height: screenWidth * 12.5,
      padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
      margin: EdgeInsets.only(bottom: screenWidth * 3),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 3)),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            // hintText: 'Going To',
            // hintStyle: TextStyle(
            // color: cityToSelectedId == 0
            //     ? Colors.grey.shade400
            //     : Colors.grey.shade800,
            // fontSize: screenWidth * 3.5)
            // hint: Text('Going To',
            //     style: TextStyle(
            //         color: cityToSelectedId == 0
            //             ? Colors.grey.shade400
            //             : Colors.grey.shade800,
            //         fontSize: screenWidth * 3.5)),
          ),
          validator: (cityToSelectedId) {
            if (cityToSelectedId == null) {
              return "Please select Going To  City";
            }
            return null;
          },
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
          hint: Text('Going To',
              style: TextStyle(
                  color: cityToSelectedId == 0
                      ? Colors.grey.shade400
                      : Colors.grey.shade800,
                  fontSize: screenWidth * 3.5)),
          onChanged: (val) {
            setState(() {
              cityToSelectedId = int.parse(val.toString());
              cityToSelectedName = val;
            });
          },
          value: cityToSelectedName,
          items: toCitiesList,
        ),
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
                if (dateTime != null && dateTime != _dateTime) {
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
                  borderRadius: BorderRadius.circular(screenWidth * 3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return "Please enter number of Passengers";
                      //   }
                      //   return null;
                      // },
                      '${monthNames[_dateTime.month - 1]} ${_dateTime.day},${_dateTime.year}',
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
                  ],
                ),
              ),
            ),
          ),
          Expanded(
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
                          borderRadius: BorderRadius.circular(screenWidth * 3)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            !addReturnTripSelected
                                ? 'Add return trip'
                                : '${monthNames[_returnDateTime.month - 1]} ${_returnDateTime.day},${_returnDateTime.year}',
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
                        ],
                      ),
                    ),
                  ),
                ),
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
          )
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
        borderRadius: BorderRadius.circular(screenWidth * 3),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter number of Passengers";
          }
          return null;
        },
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
              color: Colors.grey.shade400, fontSize: screenWidth * 3.5),
        ),
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
              fontSize: screenWidth * 3.5),
        ),
      ),
    );
  }

  Widget searchButton(screenWidth) {
    return SizedBox(
      height: screenWidth * 12.4,
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          _validateForm();
        },
        color: theme.redColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 70)),
        child: text('SEARCH', screenWidth * 4, Colors.white,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  void fetchToAndFromCities() async {
    try {
      var response = await http.get(Uri.parse(
          'https://buenoexpresstransport.com/admin/index.php?controller=pjAPI&action=GetToAndFromList'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        var fromCitiesJson = jsonData["From_Buses"];
        var toCitiesJson = jsonData["To_Buses"];
        List<DropdownMenuItem<String>> fromCitiesListLocal = [];
        List<DropdownMenuItem<String>> toCitiesListLocal = [];
        for (var item in fromCitiesJson) {
          DropdownMenuItem<String> city = new DropdownMenuItem<String>(
            child: new Text(item['name']),
            value: item['id'].toString(),
          );
          fromCitiesListLocal.add((city));
        }

        for (var item in toCitiesJson) {
          DropdownMenuItem<String> city = new DropdownMenuItem<String>(
            child: new Text(item['name']),
            value: item['id'].toString(),
          );
          toCitiesListLocal.add((city));
        }
        setState(() {
          fromCitiesList = fromCitiesListLocal;
          toCitiesList = toCitiesListLocal;
        });
      } else {
        //AlertDialog("Connection Error!");
      }
    } catch (ex) {
      //alert for data fetching failed
    }
  }

// void fetchSearchBuses() async {
//   var response = await http.get(Uri.parse("https://jsonkeeper.com/b/VTDC"));
//   var jsonData = jsonDecode(response.body);
//   if (jsonData == null) {
//     setState(() {
//       resultFetch = 'failed';
//     });
//   } else {
//     if (jsonData["code"] == 100) {
//       setState(() {
//         resultFetch = 'failed';
//         //alert no Buses found
//       });
//     }
//
//     String departureTime = '';
//     for (var bus in jsonData["buses_list"]) {
//       fromCityLocal = bus["from_location"];
//       toCityLocal = bus["to_location"];
//       departureTime = bus["departureTime"];
//       break;
//     }
//     setState(() {
//       fromCity = fromCityLocal;
//       toCity = toCityLocal;
//       resultFetch = 'success';
//       filterBus = jsonData["buses_list"];
//       // String convertTimeStampToHumanHour(int timeStamp) {
//       //   var departureTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
//       //   return DateFormat('HH:mm').format(departureTime);
//       // }
//       // date = DateFormat('EEEE, d MMM')
//       //     .format(DateTime.parse(jsonData["date"].toString()));
//     });
//   }
// }
}
