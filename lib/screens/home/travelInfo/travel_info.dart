import 'package:buenos_transportation/globalWidgets/textWidget/text_widget.dart';
import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:buenos_transportation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelInfo extends StatelessWidget {
  const TravelInfo({Key? key}) : super(key: key);

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
              pickupsBlock(screenWidth),
              pricingsBlock(screenWidth),
              travelBlock(screenWidth),
              seatingBlock(screenWidth),
              refundPolicyBlock(screenWidth),
              servicesBlock(screenWidth),
              baggagePolicyBlock(screenWidth),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }

  Widget pickupsBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Pickups', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenWidth * 7,
                        width: screenWidth * 7,
                        child: Image.asset(
                          'assets/location2_icon.png',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('Central NY', screenWidth * 4.6, Colors.white,
                              fontWeight: FontWeight.w400),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Pickup time start \nat ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                              TextSpan(
                                  text: '6 AM',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8,
                                      fontWeight: FontWeight.w700))
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenWidth * 7,
                        width: screenWidth * 7,
                        child: Image.asset(
                          'assets/location2_icon.png',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('New York City', screenWidth * 4.6, Colors.white,
                              fontWeight: FontWeight.w400),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'Pickup time start at\n',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                              TextSpan(
                                  text: '12:30 PM - 1 PM ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8,
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text: 'in The\nBronx',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 3,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenWidth * 7,
                    width: screenWidth * 7,
                    child: Image.asset(
                      'assets/location2_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text:
                              'Departure from last \nstop in w 170 Street & \nBroadway at',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: screenWidth * 2.8)),
                      TextSpan(
                          text: ' 2 PM',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: screenWidth * 2.8,
                              fontWeight: FontWeight.w700)),
                    ]),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget pricingsBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Pricing', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenWidth * 7,
                        width: screenWidth * 7,
                        child: Image.asset(
                          'assets/person_icon.png',
                        ),
                      ),
                      SizedBox(height: screenWidth * 2),
                      text('Adults', screenWidth * 3, Colors.white,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: screenWidth * 1.2),
                            height: screenWidth * 1.5,
                            width: screenWidth * 1.5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          SizedBox(
                            width: screenWidth * 2,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '\$55 + Tax ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8,
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text:
                                      'from Utica,NY (AREA) to Mcdonald\'s\n(w 170 St & Broadway),Newburgh NY, Paramus NJ,\nand Fort Lee NJ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                              TextSpan(
                                  text: 'in The\nBronx',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                            ]),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: screenWidth * 1.2),
                            height: screenWidth * 1.5,
                            width: screenWidth * 1.5,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                          SizedBox(
                            width: screenWidth * 2,
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: '\$65 + Tax ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8,
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text:
                                      'Door to Door Service.\n(Locations Restriction Apply)',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 3,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: screenWidth * 8,
                        width: screenWidth * 8,
                        child: Image.asset(
                          'assets/child_icon.png',
                        ),
                      ),
                      SizedBox(height: screenWidth * 2),
                      text('Children', screenWidth * 3, Colors.white,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth * 3,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Children 1 & under pay ',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: screenWidth * 2.8)),
                      TextSpan(
                          text: '\$40 + tax',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: screenWidth * 2.8,
                              fontWeight: FontWeight.w700)),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 2,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Parents or guardian traveling with children are responsible to bring their own car seat / booster seat.Car seats are require by law.',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Bueno Express Transportation staff may deny or remove any passenger who is causing improper conduct and/ or reckless endangerment of others in the bus. This includes but not limited to, disrespecting others, cursing, racial slurs, physical assault, sexual assault, appearing inebriated / appearing under the influence, smoking in the bus, and so on.',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget travelBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Travel', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(screenWidth),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text('Traveling dates and times may vary and change.',
                    screenWidth * 3.3, Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: screenWidth * 3),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: text(
                            'Bueno Express Transportation is not responsible for delays caused by mechanical breakdowns, bad weather, road conditions or any other conditions beyond carrier\'s control. Bueno Express will do everything possible to minimize the delays, and get passengers to their final destinations       ',
                            screenWidth * 3.3,
                            Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: screenWidth * 14,
                        width: screenWidth * 14,
                        child: Image.asset(
                          'assets/report_icon.png',
                        ),
                      ),
                    ],
                  ),
                  text('Bueno Express ansportation Corp.', screenWidth * 3.3,
                      Colors.white,
                      fontWeight: FontWeight.w700,
                      textDecoration: TextDecoration.underline)
                ],
              )
            ],
          ),
        ),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget seatingBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Seating', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: screenWidth * 12,
                        width: screenWidth * 12,
                        child: Image.asset(
                          'assets/seat_icon.png',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 2,
                      ),
                      Flexible(
                        child: text(
                            'Seats are reserve without regard to race, color, national origin or any other characteristic',
                            screenWidth * 3.6,
                            Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 3,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Passenger front seat and first Row behind the driver will be reserve and save for tall passengers or any disability conditions due to limited leg space in back rows. Passengers are responsible to let dispatcher know about any conditions so dispatcher can make seat arrangements. Passengers with the above conditions have priority seating in the front passenger seat and first row behind the driver. ',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Drivers will try their best to arrange and reserved seats for passengers with two or more adult companions.Adults traveling with children will be seated next to each.',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget refundPolicyBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Refund Policy', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: screenWidth * 7,
                        width: screenWidth * 7,
                        child: Image.asset(
                          'assets/money_icon.png',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('Full Refund', screenWidth * 4.6, Colors.white,
                              fontWeight: FontWeight.w400),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'If reservations are\ncanceled',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                              TextSpan(
                                  text: ' 1 day ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8,
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text: '\nbefore the travel date.',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: screenWidth * 7,
                        width: screenWidth * 7,
                        child: Image.asset(
                          'assets/money_icon.png',
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 3,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text('50% Refund', screenWidth * 4.6, Colors.white,
                              fontWeight: FontWeight.w400),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text:
                                      'If cancel on the same\ndate of the travel\ndate.',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: screenWidth * 2.8)),
                            ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ])),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget servicesBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Services', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
            child: Column(children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Service will be provided between w 220 Street & w 125 Street.',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Service will be provided from Fordham RD / Pelham PKWY to Downtown direction only.',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ])),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }

  Widget baggagePolicyBlock(screenWidth) {
    return Column(
      children: [
        Container(
          height: screenWidth * 13,
          width: double.infinity,
          color: theme.redColor,
          alignment: Alignment.center,
          child: text('Baggage Policy', screenWidth * 4.6, Colors.white,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: screenWidth * 4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 6),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: screenWidth * 12,
                        width: screenWidth * 12,
                        child: Image.asset(
                          'assets/luggage_icon.png',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          text(
                              '1 Personal bag, 25 pounds\nMAX (14"L x 11W" x 7"H) &\n1 luggage 50 pounds MAX (28"L x 22"W x 14"H)',
                              screenWidth * 3.6,
                              Colors.white,
                              fontWeight: FontWeight.w400),
                          text(
                              '(Additional charge of \$10 - \$20 for extra luggage of any size and weight)',
                              screenWidth * 2.2,
                              Colors.white,
                              fontWeight: FontWeight.w400)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 3,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Bueno Express Transportation Corp. is not responsible for any misplaced or damage baggage that customers brings into the bus. You are responsible for informing the driver if there is any fragile items or valuable belongings',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(screenWidth * .5),
                padding: EdgeInsets.all(screenWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(screenWidth * 3)),
                child: text(
                    'Pets or animals of any species are not  allowed in the bus due to vehicle size and to potential animal allergies of surrounding customers.',
                    screenWidth * 3.3,
                    Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        SizedBox(height: screenWidth * 8)
      ],
    );
  }
}
