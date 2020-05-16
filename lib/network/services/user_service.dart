//class UserResponse {
//  final List<User> results;
//  final String error;
//
//  UserResponse(this.results, this.error);
//
//  UserResponse.fromJson(Map<String, dynamic> json)
//      : results =
//  (json["results"] as List).map((i) => new User.fromJson(i)).toList(),
//        error = "";
//
//  UserResponse.withError(String errorValue)
//      : results = List(),
//        error = errorValue;
//}
//
//class User {
//  final String gender;
//  final Name name;
//  final Location location;
//  final String email;
//  final Picture picture;
//
//  User(this.gender, this.name, this.location, this.email, this.picture);
//
//  User.fromJson(Map<String, dynamic> json)
//      : gender = json["gender"],
//        name = Name.fromJson(json["name"]),
//        location = Location.fromJson(json["location"]),
//        email = json["email"],
//        picture = Picture.fromJson(json["picture"]);
//
//}
//
//class Location {
//  final Street street;
//  final String city;
//  final String state;
//
//  Location(this.street, this.city, this.state);
//
//  Location.fromJson(Map<String, dynamic> json)
//      : street = Street.fromJson(json["street"]),
//        city = json["city"],
//        state = json["state"];
//}
//
//class Name {
//  final String title;
//  final String first;
//  final String last;
//
//  Name(this.title, this.first, this.last);
//
//  Name.fromJson(Map<String, dynamic> json)
//      : title = json["title"],
//        first = json["first"],
//        last = json["last"];
//}
//
//class Picture {
//  final String large;
//  final String medium;
//  final String thumbnail;
//
//  Picture(this.large, this.medium, this.thumbnail);
//
//  Picture.fromJson(Map<String, dynamic> json)
//      : large = json["large"],
//        medium = json["medium"],
//        thumbnail = json["thumbnail"];
//}
//
//class Street {
//  final int number;
//  final String name;
//
//  Street(this.number, this.name);
//
//  Street.fromJson(Map<String, dynamic> json)
//      : number = json["number"],
//        name = json["name"];
//}

import 'package:blocloginflow/network/services/base_repository.dart';
import 'package:blocloginflow/network/services/services.dart';

class UserService extends BaseRepository{
  UserService(HttpServices httpServices) : super(httpServices);

  Future<void> getUser() async {
    print('This is: ${apiProvider.authService}');
    apiProvider.authService.get(
        '/',
        onResponse: (response){
          print('Call me: ${response.data}');
        },
        onError: (error){
          print('Call me error: $error');
        }
    );
  }

//  Future<void> demoCallAPI() async{
//    print('Call me C');
//    apiProvider.authService.get(
//    '/',
//    onResponse: (response){
//    print('Call me: ${response.data}');
//    },
//    onError: (error){
//    print('Call me error: ${error}');
//    }
//    );
//  }
}
