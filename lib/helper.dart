class Helper {
  static double dependOnHeight(double widgetHeight) {
    return widgetHeight / 812;
  }

  static double dependOnWidth(double widgetWidth) {
    return widgetWidth / 389;
  }

  static double dependOnHeightWithAppBar(double widgetHeight) {
    return widgetHeight / (812 - 99);
  }
}
