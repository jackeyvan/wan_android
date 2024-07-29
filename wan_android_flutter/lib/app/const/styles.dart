class LocalStyles {
  // static const IconData PUSH_ITEM_EDIT = Icons.mode_edit;
}

class LocalIcons {
  // static const String FONT_FAMILY = 'wxcIconFont';
}

///文本样式
class Strings {
  static const String github =
      "https://github.com/CarGuo/gsy_github_app_flutter";

  static const String label = "label";
  static const String home = "home";
  static const String project = "project";
  static const String platform = "platform";
  static const String structure = "structure";
  static const String languageSetting = "languageSetting";
  static const String language = "language";
  static const String themeSetting = "themeSetting";
  static const String theme = "theme";

  static const String clickToLogin = "clickToLogin";
  static const String logout = "logout";
  static const String login = "login";
  static const String loginSuccess = "loginSuccess";
  static const String register = "register";
  static const String twicePasswordDiffer = "twicePasswordDiffer";
  static const String registerSuccess = "registerSuccess";
  static const String search = "search";
  static const String putTop = "putTop";
  static const String clearSuccess = "clearSuccess";
  static const String clear = "clear";
  static const String navigator = "navigator";
  static const String change = "Refresh";
  static const String hotSearch = "hotSearch";
  static const String historySearch = "historySearch";
  static const String logoutConfirm = "logoutConfirm";
  static const String logoutSuccess = "logoutSuccess";
  static const String logoutFailure = "logoutFailure";
  static const String account = "account";
  static const String donHaveAccount = "donHaveAccount";
  static const String haveAccount = "haveAccount";
  static const String accountOrPasswordIsNull = "accountOrPasswordIsNull";
  static const String password = "password";
  static const String rePassword = "rePassword";

  static const lagerTextSize = 30.0;
  static const bigTextSize = 23.0;
  static const normalTextSize = 18.0;
  static const middleTextWhiteSize = 16.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 12.0;

  /// 转义一下特殊字符
  ///
  /// "	双引号（英文）	&quot;
  /// ‘	左单引号	&lsquo;
  /// ’	右单引号	&rsquo;
  /// ×	乘号	&times;
  /// ÷	除号	&divide;
  /// >	大于号	&gt;
  /// <	小于号	&lt;
  /// &	“与”符号	&amp;
  /// —	长破折号	&mdash;
  /// |	竖线	&#124;
  ///
  static String escape(String value) {
    return value
        .replaceAll(RegExp(r'<[^>]*>|&nbsp;'), '')
        .replaceAll(RegExp(r'<[^>]*>|&quot;'), '""')
        .replaceAll(RegExp(r'<[^>]*>|&amp;'), '&')
        .replaceAll(RegExp(r'<[^>]*>|&times;'), '×')
        .replaceAll(RegExp(r'<[^>]*>|&divide;'), '÷')
        .replaceAll(RegExp(r'<[^>]*>|&lsquo;'), '"')
        .replaceAll(RegExp(r'<[^>]*>|&rsquo;'), '"')
        .replaceAll(RegExp(r'<[^>]*>|&gt;'), '>')
        .replaceAll(RegExp(r'<[^>]*>|&lt;'), '<')
        .replaceAll(RegExp(r'<[^>]*>|&#124;'), '|')
        .replaceAll(RegExp(r'<[^>]*>|&mdash;'), '—');
  }
}

class FontSize {
  // static const lagerTextSize = 30.0;
}
