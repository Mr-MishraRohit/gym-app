class RegExpPattern {
  /// whitespace
  static final RegExp whitespaceRegExp = RegExp(r"\s+");

  /// regex to find +1 in phone number
  static final RegExp plusOneRegExp = RegExp(r"\+1");

  /// alphabetic characters with spaces
  static final RegExp alphabeticWithSpace = RegExp(r'^[a-zA-Z\s]+$');
  static final RegExp alphabeticWithSpaceInputFormatter = RegExp(r'[a-zA-Z\s]');

  /// alphabetic characters with spaces, and speacial allowed character: &, -
  static final RegExp alphabeticWithSpaceAndSpecialAllowedCharcter =
      RegExp(r'^[a-zA-Z\s&-]+$');
  static final RegExp
      alphabeticWithSpaceAndSpecialAllowedCharcterInputFormatter =
      RegExp(r'[a-zA-Z\s&-]');

  /// one or more digits ([0-9])
  static final RegExp digits = RegExp(r'^\d+$');
  static final RegExp digitsInputFormatter = RegExp(r'\d');

  /// Password should be 8-15 characters long and should contain numbers, alphabets, and underscore only
  static final RegExp password = RegExp(r'^[a-zA-Z0-9_]{8,15}$');

  /// alphabetic characters with spaces numbers and hyphen
  static final RegExp alphaNumericAndHyphen = RegExp(r'^[a-zA-Z\d- ]+$');

  /// Regular expression to match ordinal dates with suffixes.
  ///
  /// Pattern Breakdown:
  /// - `\b`: Asserts a word boundary at the start of the match, ensuring it is not part of a longer word or number.
  /// - `(\d{1,2})`: Captures one or two digits, representing the day of the month (e.g., "1", "12").
  /// - `(st|nd|rd|th)`: Captures one of the ordinal suffixes ("st", "nd", "rd", "th").
  /// - `\b`: Asserts a word boundary at the end of the match, ensuring the suffix is not followed by additional characters.
  ///
  /// Examples:
  /// - "1st" matches "1st"
  /// - "21st" matches "21st"
  /// - "11th" matches "11th"
  /// - "22nd" matches "22nd"
  ///
  /// This regex ensures that only complete ordinal dates are matched, not partial matches or those embedded in other text.
  static final RegExp ordinalDatePattern =
      RegExp(r'\b(\d{1,2})(st|nd|rd|th)\b');

  /// A regular expression pattern for matching URLs in a string.
  ///
  /// This pattern identifies URLs that start with either "http://" or "https://",
  /// followed by any non-whitespace characters. It is case-insensitive, meaning it
  /// will match URLs regardless of the case of the "http" or "https" part.
  ///
  /// Example:
  /// ```dart
  /// final RegExp urlFormatterType = RegExp(r'(http[s]?:\/\/[^\s]+)', caseSensitive: false);
  /// ```
  ///
  /// This can be useful for detecting or extracting URLs from text input, such as
  /// in a chat message or a content editor.
  ///
  /// - `caseSensitive`: false - The match is not case-sensitive.
  static final RegExp urlFormatterType = RegExp(
    r'(http[s]?:\/\/[^\s]+)',
    caseSensitive: false,
  );

  /// A regular expression that matches a comma at the start or end of a string.
  ///
  /// This pattern is used to identify and remove any leading or trailing commas
  /// in a given string. The caret (`^`) matches the start of the string, and the
  /// dollar sign (`$`) matches the end. The `|` operator combines these two patterns.
  static final RegExp leadingOrTrailingCommaRegex = RegExp(r'^,|,$');

  /// Creates a regular expression pattern for cleaning up text
  /// with whitespace and a specific line of text.
  ///
  /// This function generates a `RegExp` pattern that can be used to remove text with extra
  /// spaces and a specific line (identified by `lineText`) from a multi-line string.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final String text = '''
  ///   Some example text
  ///   - Unwanted line to remove
  ///   More example text
  ///   - Another unwanted line
  /// ''';
  ///
  /// final RegExp pattern = createCleanupRegex('- Unwanted line to remove');
  /// final String cleanedText = text.replaceAll(pattern, '');
  ///
  /// print(cleanedText);
  /// ```
  ///
  /// The above code will remove the line "- Unwanted line to remove" and any
  /// extra spaces from the `text` string, resulting in:
  ///
  /// ```
  /// Some example text
  /// More example text
  /// - Another unwanted line
  /// ```
  ///
  /// [lineText] - The specific line of text to remove from the input string.
  ///
  static RegExp createCleanupRegex(String lineText) {
    final String regexPattern = r'(\s*' + RegExp.escape(lineText) + r'\s*)';
    return RegExp(regexPattern, multiLine: true);
  }
}
