enum Flavor {
  prod,
  stage,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'Mum Health';
      case Flavor.stage:
        return 'Mum Health Stage';
      default:
        return 'title';
    }
  }

}
