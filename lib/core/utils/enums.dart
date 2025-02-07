///
/// Top Up enums
///
enum TopUpType { credit, debit }

///
/// Top Up State
///

enum TopUpStatus {
  initial,
  busy,
  selected,
  success,
  topUpAdded,
  topUpFailed,
}

///
/// View State
///
enum ViewState { initial, loading, loaded, busy, error }

///
///  SnackBar Type
///

enum SnackBarType { success, failure }
