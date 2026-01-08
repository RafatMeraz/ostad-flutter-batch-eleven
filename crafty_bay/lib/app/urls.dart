class Urls {
  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String signUpUrl = '$_baseUrl/auth/signup';
  static const String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static const String signInUrl = '$_baseUrl/auth/login';

  static const String homeSlidersUrl = '$_baseUrl/slides';

  static String categoryListUrl(int pageSize, int pageNo) =>
      '$_baseUrl/categories?count=$pageSize&page=$pageNo';

  static String productsByCategoryUrl(
    int pageSize,
    int pageNo,
    String categoryId,
  ) => '$_baseUrl/products?count=$pageSize&page=$pageNo&category=$categoryId';

  static String productDetailsUrl(String productId) =>
      '$_baseUrl/products/id/$productId';
}
