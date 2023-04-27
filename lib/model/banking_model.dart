class BankingModel {
  double  income;//get 3 years income;
  double  expense;//annualy
  String loanType;
  double  loanAmount;
  double  liabilities;


  BankingModel({
    required this.income,
    required this.expense,
    required this.loanType,
    required this.loanAmount,
    required this.liabilities,
  
  });

  factory BankingModel.fromMap(Map<String, dynamic> map){
    return BankingModel(
      income: map['income'] ?? '', 
      expense: map['expense'] ?? '', 
      loanType: map['loanType'] ?? '', 
      loanAmount: map['loanAmount'] ?? '', 
      liabilities: map['liabilities'] ?? '',
      );
  }

  Map<String, dynamic> toMap()
  {
    return{
      "income" : income,
      "expense" : expense,
      "loanType" : loanType,
      "loanAmount" : loanAmount,
      "liabilities" : liabilities,
    
    };
  }
}