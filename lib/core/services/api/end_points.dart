class EndPoint {
  // Common EndPoints

  static String baseUrl = "https://backendapi-9wqv.onrender.com/api/";
  static String signIn = "auth/login";
  static String uploadImage = "client/upload/image";

  // Driver Api Endpoints

  static String signUpDriver = "driver/register";
  static String newTrip = "driverTrip/newtrips";

  static String getDriver(id) {
    return "driver/getDriver/$id";
  }

  static String getDriverTrips(id) {
    return "trip?userId=$id&role=driver";
  }
}

class ApiKeys {
  static String status = "success";
  static String message = "message";
  static String token = "token";
  static String name = 'fullName';
  static String password = "password";
  static String confirmPassword = "confirmPassword";
  static String email = "email";
  static String phoneNumber = "phoneNumber";
  static String id = "id";
}
