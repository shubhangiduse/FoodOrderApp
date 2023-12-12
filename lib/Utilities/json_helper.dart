class JsonHelper {
  static bool parseBool(Map<String, Object?> json, String fieldName) {
    return json[fieldName].toString().toLowerCase() == 'true' ? true : false;
  }

  static int parseInt(Map<String, Object?> json, String fieldName) {
    return int.tryParse(json[fieldName].toString()) ?? 0;
  }

  static double parseDouble(Map<String, Object?> json, String fieldName) {
    return double.tryParse(json[fieldName].toString()) ?? 0.0;
  }

  static String parseStringCz(Map<String, Object?> json, String fieldName) {
    return json[fieldName] == null ? '' : json[fieldName].toString();
  }

  static String? parseStringCzN(Map<String, Object?> json, String fieldName) {
    return json[fieldName]?.toString();
  }

  static Map<String, dynamic> parseMap(Map<String, Object?> json, String fieldName) {
    return json[fieldName] == null ? {} : json[fieldName] as Map<String, dynamic>;
  }

  static List<String> parseArray(Map<String, Object?> json, String fieldName) {
    return (json[fieldName] as List).map((e) => e as String).toList();
  }

  static T parseEnumOrDefaultCz<T extends Enum>(
      Map<String, Object?> json, String fieldName, List<T> enumValues) {
    String fieldValue = json[fieldName] == null ? '' : json[fieldName].toString();

    if (fieldValue == '') {
      return enumValues.first;
    } else {
      try {
        T enumValue = enumValues.byName(fieldValue);
        return enumValue;
      } catch (e) {
        return enumValues.first;
      }
    }
  }
}
