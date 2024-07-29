enum BuildFlavor { dev, test, release }

class BuildEnv {
  final BuildFlavor flavor;

  BuildEnv.dev() : flavor = BuildFlavor.dev;

  BuildEnv.release() : flavor = BuildFlavor.release;

  BuildEnv.test() : flavor = BuildFlavor.test;

  isDev() => flavor == BuildFlavor.dev;

  isTest() => flavor == BuildFlavor.test;

  isRelease() => flavor == BuildFlavor.release;

  enableLog() => isDev() || isTest();
}
