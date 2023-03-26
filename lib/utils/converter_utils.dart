class ConverterUtils {
  static convertResultJsonToObject<T>(dynamic object, clazzTarget) {
    return (object as List).map((item) => clazzTarget?.fromJson(item)).toList();
  }
}
