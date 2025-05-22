

class ErrorMessage {
  // Authentication
  static const nameRequired = "Full name is required";
  static const nickNameRequired = "Nick name is required";
  static const phoneNumberRequired = "Mobile number is required";
  static const emailRequired = "Email is required";
  static const emailFormat = "Invalid email format";
  static const passwordRequired = "Password is required";
  static const confirmPasswordRequired = "Confirm-Password is required";
  static const bothPasswordUnmatched = "Both passwords entered do not match.";

  static const nameOnlyAlphabeticCharactersValidation =
      "Name should include only alphabetic characters";
  static const phoneNumberValidation = "Invalid phone number";
  static const passwordValidation =
      "Password should be 8-15 characters long and should contain numbers, alphabets, and underscore only.";
  static const passwordNotMatchValidation =
      "Password and Confirm password does not matches";
  static const passwordMatchValidation = "Passwords match!";
  static const wrongPasswordValidation =
      "The password you have entered is incorrect";
  static const resetPasswordPhoneNumberDefaultMessage =
      "We will send the reset link to this email Address.";

  // toast errors
  static const somethingWentWrong = "Something went wrong";
  static const timeoutErrorMessage = "Server is Temporarily Unavailable";
  static const pleaseEnterRegisterNumber = "Please enter register number";
  static const passwordChangedSuccessfullyMessage =
      "Password changed successfully";
  static const noInternetConnectionMessage = "No Internet Connection";
  static const noInternetConnectionSubMessage =
      "Please check your internet connectivity.";
  static const requestSentSuccessfullyMessage = "Request sent successfully";
  static const failedToSendRequestMessage = "Failed to send request";

  // Message from server side
  /// server response with this message when use has entered invalid otp
  static const wrongOtpServerMessage = "Invalid OTP";
}
