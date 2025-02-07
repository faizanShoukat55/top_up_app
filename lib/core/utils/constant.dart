class Constant {
  static int maxAllowBeneficiaries = 3;
  static int topUpFee = 3;
  static List<double> topUpAmount = [5, 10, 20, 30, 50, 75, 100];
  static String currency = 'AED';
  // static double monthlyTopUpLimit = 3000.0;
  // static double verifiedBeneficiaryLimit = 1000.0;
  // static double unVerifiedBeneficiaryLimit = 500.0;
  static double monthlyTopUpLimit = 50.0;
  static double verifiedBeneficiaryLimit = 20.0;
  static double unVerifiedBeneficiaryLimit = 10.0;
  static String topUpSuccessMessage = "Top Up added successfully";
  static String genericErrorMessage = "Some thing went wrong";
  static String inSufficientBalance="You don't have sufficient balance including $topUpFee $currency fee";
  static String monthlyLimitReached="You have reached monthly top up limit";
  static String payeesMonthlyLimitReached="You have reached monthly top up limit for this beneficiary";
  static String noRecordFound="No Record Found";
}
