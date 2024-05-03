class User {
  late String _email;
  late String _username;
  late String _userId;
  late String _phoneNumber;

  // Private constructor
  User._privateConstructor();

  // Singleton instance
  static final User _instance = User._privateConstructor();

  // Getter for the singleton instance
  factory User() {
    return _instance;
  }

  // Getters for email, username, and userId
  String get email => _email;
  String get username => _username;
  String get userId => _userId;
  String get phoneNumber => _phoneNumber;

  // Setters for email, username, and userId
  setEmail(String email) {
    _email = email;
  }

  setUsername(String username) {
    _username = username;
  }

  setUserId(String userId) {
    _userId = userId;
  }

  setPhoneNumber(String phoneNumber){
    _phoneNumber = phoneNumber;
  }

}
