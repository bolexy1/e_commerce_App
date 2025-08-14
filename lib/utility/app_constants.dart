class AppConstants {
  static const String APP_NAME ="DBFood";
  static const int APP_VERSION =1;
  
  // ignore: constant_identifier_names
  //  static const String BASE_URL = "https://api.npoint.io";
   static const String BASE_URL = "http://127.0.0.1:8000";
  // static const String POPULAR_PRODUCT_URI= "/7888d1d35ece17683079";
  // static const String RCOMMENDED_PRODUCT_URI= "/12daca288bca16ab6c35";
  // user and Auth endpoint
  static const String REGISTRATION_URI= "/12daca288bca16ab6c35";
  static const String LOGIN_URI= "//api/v1/auth/login";
  static const String USER_INFO_URI= "//api/v1/customer/info";
  //  static const String REGISTRATION_URI= "//api/v1/auth/register";
     static const String POPULAR_PRODUCT_URI= "/api/v1/products/popular";
  static const String RCOMMENDED_PRODUCT_URI= "/api/v1/products/recommended";
  // static const String DRINKS_URI = "/api/v1/products/drinks";
  // static const String UPLOAD_URI ="/uploads/";

  static const String TOKEN ="";
  static const String PHONE ="";
  static const String PASSWORD ="";
  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";

}
