import 'my_exeptions.dart';

void main() {
  try {
    User.createUser('erjanesen@mail.com', '123', '123');
  } catch (e) {
    print(e);
  }
}

class User {
  String login = 'example@gmail.com,';
  String passoword = 'example123),';

  static createUser(String login, String password, String confirmPassword) {
    if (!validateStructure(login)) {
      throw WrongLoginException();
    } else if (!validatePassword(password)) {
      throw WrongPasswordException();
    } else if (confirmPassword != password) {
      throw WrongConfirmPasswordException();
    } else {
      print('ok');
    }
  }
}

bool validatePassword(String value) {
  String pattern = r'^(?=.*?[a-z])(?=.*?[0-9]).{1,20}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

bool validateStructure(String value) {
  String pattern = r'^(?=.*?[a-z])(?=.*?[@]).{0,20}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}
