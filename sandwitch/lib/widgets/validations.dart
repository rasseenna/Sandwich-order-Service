class Validation {
  static String? validatePhoneNumber(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value!.length == 0) {
      return ' Enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return ' Enter valid mobile number';
    } else if (value.length < 10 || value.length > 10) {
      return ' Enter valid mobile number';
    }
  }

  static String? validatePassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Password must contain atleast one uppercase,one lowercase,special character and should be atleast 8 charcters long';
      } else {
        return null;
      }
    }
  }
  static String? validateLoginPassword(String? value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Please enter password';
    }
    // if (!regex.hasMatch(value)) {
    //   return 'Password must contain atleast one uppercase,one lowercase,special character and should be atleast 8 charcters long';
    // }
    else {
      return null;

    }
  }
  static String? validateAcademy(String? value) {
    if (value!.length == 0) {
      return ' Enter Academy name';
    }
  }

  static String? validateAddress(String? value) {
    if (value!.isEmpty) {
      return ' Enter address';
    }
  }
  static String? validateBranch(String? value) {
    if (value!.isEmpty) {
      return ' Enter branch name';
    }
  }
  static String? validateFullName(String? value,String? message) {
    if (value!.length == 0) {
      return message;
    }
  }

  static String? validateBankName(String? value) {
    if (value!.length == 0) {
      return ' Enter Bank name';
    }
  }

  static String? validateIFSCCode(String? value) {
    String regExp = "^[A-Z]{4}[0][A-Z0-9]{6}";
    RegExp regex = RegExp(regExp);
    if (value!.isEmpty) {
      return 'Enter a valid IFSC Code';
    } else if (!regex.hasMatch(value!)) {
      return 'Enter a valid IFSC Code';
    }
  }

  static String? validateEmailAddress(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!) || value == null)
      return 'Enter a valid email address';
    else
      return null;
  }

  // static String validateEmailAddress(String value) {
  //   if (value.length == 0) {
  //     return 'Please enter email address';
  //   } else if (RegExp(
  //               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //           .hasMatch(value) ==
  //       false) {
  //     return 'Please enter valid  email address';
  //   }
  // }

  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return ' Enter name';
    } else if (value.length < 3) {
      return 'Name must be more than 2 character';
    }
    return null;
  }
  static String? validateAccountNumber(String? value) {
    if (value!.isEmpty) {
      return 'Enter Account number';
    } else if (value.length < 8) {
      return 'Enter Account number';
    }
    return null;
  }

  static String? validateItem(String value) {
    if (value.isEmpty) {
      return ' Enter item name';
    }
    return null;
  }

  static String? validatedate(String value) {
    if (value.isEmpty) {
      return ' Enter date of birth';
    }
    return null;
  }

  static String? opendate(String value) {
    if (value.isEmpty) {
      return ' Enter date';
    }
    return null;
  }

  static String? validatePanNumber(String value) {
    String pattern = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
    RegExp regex = new RegExp(pattern);

    if (value.isEmpty) {
      return 'Please enter PAN Number';
    } else if (!regex.hasMatch(value)) {
      return 'Enter Valid PAN Number';
    }

    return null;
  }

  // static String? validatePinCode(String value) {
  //   // //String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  //   Pattern pattern = r'(^[1-9][0-9]{5}$)';
  //   //
  //   // // Pattern pattern = "(^[1-9]{1}[0-9]{2}\\s{0, 1}[0-9]{3}$)";
  //   RegExp regex = RegExp(pattern);
  //
  //   if (value.isEmpty) {
  //     return 'Please enter PIN Code';
  //   } else if (!regex.hasMatch(value)) {
  //     return 'Enter Valid PIN Code';
  //   } else if (value.length > 6 || value.length < 6) {
  //     return 'Enter Valid PIN Code';
  //   }
  //
  //   return null;
  // }

  String? validateMobile(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}
