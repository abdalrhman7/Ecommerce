class ApiPath {
  static String products() => 'products/';
  static String user(String uid) => 'users/$uid';


  static String addToCart(String uid, String addToCartId) => 'users/$uid/cart/$addToCartId';
  static String myProductsCart(String uid) => 'users/$uid/cart/';


  static String myFavorite(String uid) => 'users/$uid/favorite/';
  static String addToFavorite(String uid, String addToFavoriteId) => 'users/$uid/favorite/$addToFavoriteId';
  static String getIsFavorite(String uid , String docId) => 'users/$uid/favorite/$docId/';

  // static String userShippingAddress(String uid) => 'users/$uid/shippingAddresses/';
  // static String newAddress(String uid, String addressId) => 'users/$uid/shippingAddresses/$addressId';
  // static String deliveryMethods() => 'deliveryMethod/';

}