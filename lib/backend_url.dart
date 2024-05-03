class BackendUrl {
  static String baseUrl = "http://10.0.2.2:8080";


  //Customer Url
  static String saveCustomer = "$baseUrl/api/customer/saveCustomer";
  static String loginUrl = "$baseUrl/api/customer/login";
  static String getAllRestaurants = "$baseUrl/api/restaurant/retrieveAllRestaurants";
  static String mealById = "$baseUrl/api/meal/retrieveMealById";
  
}
