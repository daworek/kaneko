import 'package:kaneko/banking_account/banking_user.dart';

class CannotGetBankingInfo implements Exception {}

class Money {
  List<double> amount = List.empty(growable: true);
  List<String> currency = List.empty(growable: true);
}

class Loan {
  double amount = 0.0;
  double left = 0.0;
  double nextPayment = 0.0;
  DateTime nextPaymentDeadline = DateTime.now();
  String currency = "";
}

class TermDeposit {
  double amount = 0.0;
  String currency = "";
  double interests = 0.0;
  DateTime start = DateTime.now();
  DateTime end = DateTime.now();
}

class UpcomingTransfer {
  String title = "";
  String currency = "";
  String receiver = "";
  double amount = 0.0;
  DateTime deadline = DateTime.now();
}

class RecentTransfer {
  String title = "";
  String currency = "";
  String receiver = "";
  double amount = 0.0;
  DateTime executed = DateTime.now();
}

class BankingAccount {
  Money _money = new Money();
  List<Loan> _loans = List.empty(growable: true);
  List<TermDeposit> _termDeposits = List.empty(growable: true);
  List<UpcomingTransfer> _upcomingTransfers = List.empty(growable: true);
  List<RecentTransfer> _recentTransfers = List.empty(growable: true);

  BankingAccount(BankingUser user) {
    if (user.getUsername() == "TestUser" && user.getUserId() == 1) {

      _money.amount.add(50000); _money.currency.add("PLN");
      _money.amount.add(4760); _money.currency.add("USD");

      var l = new Loan();
      l.currency = "CHF";
      l.amount = 100000;
      l.left = 3546;
      l.nextPayment = 1589;
      l.nextPaymentDeadline = new DateTime.utc(2021, 12, 20);
      _loans.add(l);

      var td = new TermDeposit();
      td.amount = 10000;
      td.currency = "EUR";
      td.interests = 0.2;
      td.start = new DateTime(2021, 1, 1);
      td.end = new DateTime(2022, 1, 1);
      _termDeposits.add(td);

      var ut = new UpcomingTransfer();
      ut.amount = 1300;
      ut.currency = "PLN";
      ut.receiver = "Jan Kowalski";
      ut.title = "Czynsz";
      ut.deadline = new DateTime(2021, 7, 1);
      _upcomingTransfers.add(ut);

      var rc1 = new RecentTransfer();
      rc1.amount = 1300;
      rc1.currency = "PLN";
      rc1.receiver = "Jan Kowalski";
      rc1.title = "Czynsz";
      rc1.executed = new DateTime(2021, 6, 1);
      _recentTransfers.add(rc1);
      var rc2 = new RecentTransfer();
      rc2.amount = 103;
      rc2.currency = "EUR";
      rc2.receiver = "Amazon";
      rc2.title = "Shopping";
      rc2.executed = new DateTime(2021, 5, 12);
      _recentTransfers.add(rc2);
      var rc3 = new RecentTransfer();
      rc3.amount = 13;
      rc3.currency = "PLN";
      rc3.receiver = "Janek";
      rc3.title = "Za piwo";
      rc1.executed = new DateTime(2021, 5, 4);
      _recentTransfers.add(rc3);

    } else {
      throw CannotGetBankingInfo();
    }
  }
}