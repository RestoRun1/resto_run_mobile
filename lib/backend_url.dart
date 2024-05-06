class BackendUrl {
  static String baseUrl = "http://10.0.2.2:8080";


  //Customer Url
  static String saveCustomer = "/api/customer/saveCustomerMobile";
  static String loginUrl = "$baseUrl/api/customer/login";
  static String getAllRestaurants = "/api/restaurant/retrieveAllRestaurants";
  static String mealById = "api/meal/retrieveMealById";
  static String addReservation = "api/reservation/saveReservation";
  
}
