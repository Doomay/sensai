// matching various patterns for kinds of data
enum ValidatorType {
  notEmpty,
  minSize,
  maxSize,
  number,
  password,
  email,
  amount
}

class Validator {
  List<ValidatorType>? validations;
  bool required;
  int minSize;
  int maxSize;
  String? fieldName;
  Validator(
      {this.required = false,
      this.validations,
      this.minSize = 0,
      this.maxSize = 0,
      this.fieldName});
  String? validate(String? value) {
    String? response;
    if (required) {
      response = notEmpty(value!);
      if (response != null) {
        return response;
      }
    }
    if (validations != null && validations!.isNotEmpty) {
      for (int i = 0; i < validations!.length; i++) {
        switch (validations![i]) {
          case ValidatorType.minSize:
            response = checkMinSize(value!);
            break;
          case ValidatorType.maxSize:
            response = checkMaxSize(value!);
            break;
          case ValidatorType.password:
            response = password(value!);
            break;
          case ValidatorType.number:
            response = number(value!);
            break;
          case ValidatorType.email:
            response = email(value!);
            break;
          case ValidatorType.amount:
            response = amount(value!);
            break;
          default:
        }
        if (response != null) {
          break;
        }
      }
    }

    if (response != null) {
      return response;
    } else {
      return null;
    }
  }

  String? email(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern as String);
    if (value.trim().isNotEmpty && !regex.hasMatch(value)) {
      return "Enter a valid email";
    } else {
      return null;
    }
  }

  String? password(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (value.trim().isNotEmpty && !regex.hasMatch(value)) {
      return "Enter a valid password";
    } else {
      return null;
    }
  }

  String? checkMinSize(String value) {
    String strPattern = '^.{$minSize,}\$';
    //Pattern pattern = r"${strPattern}";
    RegExp regex = RegExp(strPattern);
    // RegExp regex = new RegExp(pattern);
    //if (!regex.hasMatch(value))
    if (value.trim().isNotEmpty && value.length < minSize) {
      return '$fieldName is less than $minSize character.';
    } else {
      return null;
    }
  }

  String? checkMaxSize(String value) {
    String strPattern = '^.{$maxSize,}\$';
    //Pattern pattern = r"${strPattern}";
    RegExp regex = RegExp(strPattern);
    // RegExp regex = new RegExp(pattern);
    if (value.trim().isNotEmpty && value.length > maxSize) {
      return '$fieldName should be less than $maxSize character.';
    } else {
      return null;
    }
  }

  String? name(String? value) {
    Pattern pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern as String);
    if (value!.trim().isNotEmpty && !regex.hasMatch(value)) {
      return "Enter a valid name";
    }
    if (value.trim().isEmpty) {
      return "Field should not be empty";
    } else {
      return null;
    }
  }

  String? number(String? value) {
    Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regex = RegExp(pattern as String);
    if (value!.trim().isNotEmpty && !regex.hasMatch(value)) {
      return "Enter a valid number";
    }
    if (value.trim().isEmpty) {
      return "Field should not be empty";
    } else {
      return null;
    }
  }

  String? amount(String? value) {
    Pattern pattern = r'(^[1-9]\d*\.?\d*)';
    RegExp regex = RegExp(pattern as String);
    if (value!.trim().isNotEmpty && !regex.hasMatch(value)) {
      return "Enter a valid amount";
    }
    if (value.trim().isEmpty) {
      return "Field should not be empty";
    } else {
      return null;
    }
  }

  String? notEmpty(String? value) {
    //Pattern pattern = r'^\S+$';
    // RegExp regex = new RegExp(pattern);
    //if (!regex.hasMatch(value))
    if (value!.trim().isEmpty) {
      return "Field should not be empty";
    } else {
      return null;
    }
  }
}
