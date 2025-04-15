class Endpoints {
  static const String login = 'auth/login';
  static const String register = 'auth/signup';
  static const String updateProfile = 'profile/update';
  static const String updateProfileImage = 'profile/update-image';
  static const String registerConfirmOtp = 'auth/confirm_code';
  static const String registerResendCode = 'auth/resend_code';
  static const String forgotPasswordRequest =
      'auth/password/forget_request'; //{"email_or_phone": "nouraabozad@gmail.com","send_code_by": "email"}
  static const String forgotPasswordResendCode =
      'auth/password/resend_code'; //{"email_or_code": "","verify_by": ""}
  static const String forgotPasswordConfirmRest =
      'auth/password/confirm_reset'; //{"verification_code": "","password": ""}
  static const String forgotPasswordRequestPassword =
      'auth/password/password_reset';

  static const String logout = 'auth/logout';
  static const String selectShippingAddress = 'user/shipping/make_default';
  static const String getCountries = 'countries';
  static const String getStates = 'states';
  static const String getCities = 'cities';
  static const String getUserAddress = 'user/shipping/address';
  static const String editUserAddress = 'update-address-in-cart';
  static const String addUserNewAddress = 'user/shipping/create';
  static const String deleteUserAddress = 'user/shipping/delete/';
  static const String userInfo = 'get-user-by-access_token';
  static const String verify = 'verify';
  static const String sliders = 'sliders';
  static const String categories = 'categories';
  static const String banners = 'banners';
  static const String featuredProducts = 'products/featured';
  static const String betsSellingProducts = 'products/best-seller';
  static const String newProducts = 'products/new';
  static const String offersProducts = 'products/offer';

  static const String getCart = 'carts';
  static const String createOrder = 'order/store';
  static const String paymentTypes = 'payment-types';
  static const String addToCart = 'carts/add';
  static const String removeFromCart = 'carts/';

  static const String cartChangeQuantity = 'carts/change-quantity';
  static const String cartSummary = 'cart-summary';
  static const String applyCoupon = 'coupon-apply';
  static const String removeCoupon = 'coupon-remove';

  static const String topBrands = 'brands/top';
  static const String productSearch = 'products/search';
  static const String productsByBrand = 'products/brand/';
  static const String productsByCategory = 'products/category/';

  static const String productDetails = 'products/';
  static const String relatedProducts = 'products/frequently-bought/';
  static const String productReviews = 'reviews/product/';
  static const String submitReview = 'reviews/submit';
  static const String wishList = 'wishlists';
  static const String addToWishList = 'wishlists-add-product';
  static const String removeFromWishList = 'wishlists-remove-product';
  static const String category = 'category';
  static const String chatFilters = 'chat-history-filters';
  static const String contacts = 'contacts';
  static const String chatHistory = 'chat-history';
  static const String resendOtp = 'resend-verification-code';
  static const String conversations = 'conversations';
  static const String sendMessage = 'conversations/send-message';
  static const String sendTemplate = 'conversations/send-template';
  static const String sendPrivateMessage = 'conversations/send-private-message';
  static const String sendVoiceNote = 'conversations/send-voice-note';
  static const String closeChat = 'conversations/mark-as-closed';
  static const String changeReadStatus = 'conversations/change-read-status';
}
