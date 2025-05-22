class DateTimeFormat {
  /// Example, Jan, Feb, Mar
  static const String abbreviatedMonth = "MMM";

  /// Example: "20230912_103015" (for September 12, 2023, at 10:30:15 AM)
  static const String timestampFormatted = "yyyyMMdd_HHmmss";

  /// Example: "09/12/2023" (for September 12, 2023)
  static const String MMddYYYY = "MM/dd/yyyy";

  /// Example: "12/09/2023" (for 12th September 2023)
  static const String ddMMYYYY = "dd/MM/yyyy";

  /// Example: "2023-09-12" (for September 12, 2023)
  static const String yyyyMMddDashFormat = "yyyy-MM-dd";

  /// Example: "10:30 AM" (for 10:30 in the morning, 12-hour clock format)
  static const String twelveHourTimeFormat = "h:mm a";

  /// Example: "12/09" (for September 12th)
  static const String ddMM = "dd/MM";

  /// Example: "10:30" (24-hour time format, without leading zero for hour)
  static const String Hm = "Hm";

  /// Example: "12 Sep 2023" (for 12th September 2023)
  static const String dMMMyyy = "d $abbreviatedMonth yyyy";

  /// Example: "November 17, 2024" (for 17th November 2024)
  static const String MMMMdyyyy = "MMMM d, yyyy";

  /// Example: "03/21/2024, 09:12 AM" (for 21th March 2024 9:12 AM)
  static const String MMMMdyyyyWithTwelveHourTimeFormat = "$MMddYYYY, hh:mm a";
}
