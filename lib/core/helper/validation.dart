

abstract class Validation {
 static String? emailValidator(String? value)
  {
    RegExp reg=RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(value!.isEmpty)
    {
      return "Email is empty";
    }

    else if(!reg.hasMatch(value))
    {
      return 'Email Not valid';
    }
    return null;
  }



 static String? passValidator(String? value)
  {
    final hasUppercase = value?.contains(RegExp(r'[A-Z]'));
    final hasDigits = value?.contains(RegExp(r'[0-9]'));
    final hasLowercase = value?.contains(RegExp(r'[a-z]'));
    // bool hasSpecialCharacters = value.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    if(value!.isEmpty)
    {
      return 'Password invalid';
    }
    else if(value.length<6)
    {
      return 'passwrod must be enter the 6 digits';
    }

    else if(!hasUppercase!)
    {
      return 'One character must be uppercase';
    }
    else if(!hasLowercase!)
    {
      return 'One character must be lower case';
    }
    else if(!hasDigits!)
    {
      return 'Atleast one digit must be number';
    }
    return null;
  }


 static String? nameValidator(String? value)
  {
    if(value!.isEmpty)
    {
      return 'Please enter the name';
    }
    return null;
  }

 static String? phoneValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter phone number';
    } else if (value.length < 6) {
      return 'Number too short.';
    }
    return null;
  }



 static String? titleValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter title';
    }
    return null;
  }

 static String? priceValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter price';
    }
    return null;
  }

 static String? addressValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }


 static String? whatsUpNumberValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter phone number';
    } else if (value.length < 6) {
      return 'Number too short.';
    }
    return null;
  }


 static String? brandValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter brand';
    }
    return null;
  }

 static String? brandDescriptionValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter brand Description';
    }
    return null;
  }

 static String? highlightValidation(String? value){
    if (value!.isEmpty) {
      return 'Please enter highlight';
    }
    return null;
  }

}





