import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
abstract class SuperwizorFunction {

  static unFocus(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }


  static countryPicker(BuildContext context,{Function(Country)? onSelect}){

    showCountryPicker(
      context: context,
      showPhoneCode: true,
      searchAutofocus: true,
      showWorldWide: false,
      countryListTheme: CountryListThemeData(
        backgroundColor: Theme.of(context).cardColor,
        textStyle: Theme.of(context).textTheme.displaySmall,
      ),
      // countryFilter: ,
      onSelect: onSelect!,
    );

  }



}