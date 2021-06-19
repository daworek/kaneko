class BankingUser {
  String _username = "";
  int _userId = -1;

  static BankingUser getBankingUser(String username, int userId) {
    var user = new BankingUser();
    user._username = username;
    user._userId = userId;
    return user;
  }

  String getUsername() => _username;
  int getUserId() => _userId;
}