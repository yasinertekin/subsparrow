/// Subscription length enum
enum SubLength {
  /// One month subscription
  oneMonth,

  /// Three month subscription
  threeMonth,

  /// Six month subscription
  sixMonth,

  /// Twelve month subscription
  year,
}

/// This method is responsible for getting subscription days
int getSubscriptionDays(SubLength subLength) {
  switch (subLength) {
    case SubLength.oneMonth:
      return 30;
    case SubLength.threeMonth:
      return 90;
    case SubLength.sixMonth:
      return 180;
    case SubLength.year:
      return 365;
  }
}
