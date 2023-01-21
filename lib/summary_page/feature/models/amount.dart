class Amount {
  String name;
  double value;

  Amount(this.name, this.value);
}

class BudgetSummaryMocks {
  static Amount balance = Amount("BALANCE", 100.0);
  static Amount income = Amount("INCOME", 130.0);
  static Amount expenses = Amount("EXPENSES", 160.0);
}
