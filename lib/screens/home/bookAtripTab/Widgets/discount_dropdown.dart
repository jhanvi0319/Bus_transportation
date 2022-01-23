import 'package:buenos_transportation/responsiveBloc/size_config.dart';
import 'package:flutter/material.dart';

class DiscountDropDown extends StatefulWidget {
  const DiscountDropDown({Key? key}) : super(key: key);

  @override
  _DiscountDropDownState createState() => _DiscountDropDownState();
}

class _DiscountDropDownState extends State<DiscountDropDown> {
  List<String> listOfDiscounts = ['200', '400', '700'];
  String discountSelected = '';
  @override
  Widget build(BuildContext context) {
    var screenWidth = SizeConfig.widthMultiplier;
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
                  'assets/expand_arrow_down_icon.png',
                  fit: BoxFit.contain,
                ),
              ),
              isExpanded: true,
              style: TextStyle(color: Colors.grey.shade900, fontSize: 13),
              hint: Text(
                  discountSelected.isEmpty ? 'Discount' : discountSelected,
                  style: TextStyle(
                      color: discountSelected.isEmpty
                          ? Colors.grey.shade400
                          : Colors.grey.shade800,
                      fontSize: screenWidth * 3.5)),
              onChanged: (val) {
                setState(() {
                  discountSelected = val.toString();
                });
              },
              items: [
                for (int i = 0; i < listOfDiscounts.length; i++)
                  DropdownMenuItem(
                      value: listOfDiscounts[i], child: Text(listOfDiscounts[i]))
              ])),
    );
  }
}
