class User {
  User(this.email, this.image);
  String email;
  String image;
}

class UserEmail {
  UserEmail(this.email);
  final String email;
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
  }
  return newState;
}

class AppState {
  AppState(
      {this.email = 'undefined Email', this.imageURL = 'undefined Image'});
  AppState.fromAppState(AppState another) {
    email = another.email;
    imageURL = another.imageURL;
  }
  String email, imageURL;
}