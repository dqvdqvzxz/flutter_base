import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

saveStringToSP({@required String stringKey, @required String stringValue}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(stringKey, stringValue);
}

saveStringListToSP({@required String stringListKey, @required List<String> stringListValue}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList(stringListKey, stringListValue);
}

saveIntToSP({@required String intKey, @required int intValue}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(intKey, intValue);
}

saveDoubleToSP({@required String doubleKey, @required double doubleValue}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(doubleKey, doubleValue);
}

saveBoolToSP({@required String boolKey, @required bool boolValue}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(boolKey, boolValue);
}

getStringFromSP({@required String stringKey}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String stringValue = prefs.getString(stringKey);
  return stringValue;
}

getStringListFromSP({@required String stringListKey}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> stringListValue = prefs.getStringList(stringListKey);
  return stringListValue;
}

getIntFromSP({@required String intKey}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int intValue = prefs.getInt(intKey);
  return intValue;
}

getDoubleFromSP({@required String doubleKey}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  double doubleValue = prefs.getDouble(doubleKey);
  return doubleValue;
}

getBoolFromSP({@required String boolKey}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool boolValue = prefs.getBool(boolKey);
  return boolValue;
}

removeFromSP({@required String stringKey}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(stringKey);
}

removeAllFromSP() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

checkKeyOnSP({@required String stringKey}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isExist = prefs.containsKey(stringKey);
  return isExist;
}

