/// [HomeGridViewBuilder] is used to build the grid view in the home page.
enum HomeGridViewBuilder {
  /// [totalPrice] is the total price of the subscriptions.
  totalPrice,

  /// [monthlyPrice] is the monthly price of the subscriptions.
  monthlyPrice,

  /// [subCount] is the count of the subscriptions.
  subCount
}

/// [HomeGridViewBuilderExtension] is used to get the string value of the enum.
extension HomeGridViewBuilderExtension on HomeGridViewBuilder {
  /// Returns the string value of the enum.
  String get title => {
        HomeGridViewBuilder.totalPrice: 'Toplam Harcama',
        HomeGridViewBuilder.monthlyPrice: 'Aylık Harcama',
        HomeGridViewBuilder.subCount: 'Abonelik Sayısı',
      }[this]!;

  /// Returns the string value of the enum.
  String getPrice({
    required String totalPrice,
    required String monthlyPrice,
    required String subCount,
  }) {
    return {
      HomeGridViewBuilder.totalPrice: '$totalPrice ₺',
      HomeGridViewBuilder.monthlyPrice: '$monthlyPrice ₺',
      HomeGridViewBuilder.subCount: subCount,
    }[this]!;
  }
}
