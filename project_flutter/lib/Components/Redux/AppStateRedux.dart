import 'dart:io';

class User {
  User(this.email, this.image);
  String email;
  String image;
}

class UserEmail {
  UserEmail(this.email);
  final String email;
}

class UserImages {
  UserImages(this.image);
  final File image;
}

class UserImageURL {
  UserImageURL(this.imageURL);
  final String imageURL;
}

AppState reducer(AppState prevState, dynamic action) {
  final AppState newState = AppState.fromAppState(prevState);
  if (action is UserEmail) {
    newState.email = action.email;
  } else if (action is UserImageURL) {
    newState.imageURL = action.imageURL;
  } else if (action is UserImages) {
    newState.imageList.add(action.image);
  }
  return newState;
}

class AppState {
  AppState(
      { this.email = 'undefined Email',
        this.imageURL = 'undefined Image',
        this.imageList,
      });
  AppState.fromAppState(AppState another) {
    email = another.email;
    imageURL = another.imageURL;
    imageList = another.imageList;
  }
  String email, imageURL;
  List<File> imageList;
}