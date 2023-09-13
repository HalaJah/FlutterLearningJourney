import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class SelectDate{
  static CalendarDatePicker2WithActionButtonsConfig dialog = CalendarDatePicker2WithActionButtonsConfig(
    weekdayLabelTextStyle: const TextStyle(
                               fontFamily: 'Merriweather',
                               fontSize: 12,
                               color: Colors.pink,),
  
calendarType: CalendarDatePicker2Type.range,
  yearTextStyle:const TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 12,
    color: Colors.black, 
    ),
  
  lastMonthIcon: const Icon(
    Icons.arrow_back_ios_rounded,
    size: 14, 
    color: Color.fromRGBO(66, 66, 66, 1),
    ),
  nextMonthIcon: const Icon(
    Icons.arrow_forward_ios_rounded,
    size: 14, 
    color: Color.fromRGBO(66, 66, 66, 1),
    ),
  controlsTextStyle: const TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 12,
    color: Color.fromRGBO(66, 66, 66, 1), 
    ),
  dayTextStyle: const TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 12,
    color: Colors.black, 
    ),
   selectedDayTextStyle: const TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 12,
    color: Colors.pink, 
    ),
  selectedDayHighlightColor: const Color.fromRGBO(244, 143, 177, 1),
  selectedRangeHighlightColor: const Color.fromARGB(255, 234, 186, 202),
  cancelButtonTextStyle: const TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 12,
    color:Color.fromRGBO(244, 143, 177, 1),
  ),
 
okButtonTextStyle: const TextStyle(
    fontFamily: 'Merriweather',
    fontSize: 12,
    color: Color.fromRGBO(244, 143, 177, 1),
  ),  
   
                      
  );
}

