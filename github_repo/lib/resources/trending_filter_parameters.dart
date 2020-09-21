import 'package:github_repo/generated/i18n.dart';

class TrendingFilterParameters {
  static const PARAMETER_NAME_SINCE = "since";

  static const SINCE_TODAY = "daily";
  static const SINCE_WEEK = "weekly";
  static const SINCE_MONTH = "monthly";

  static final List<Map<String, String>> filterSinceValueMap = [
    {PARAMETER_NAME_SINCE: SINCE_TODAY},
    {PARAMETER_NAME_SINCE: SINCE_WEEK},
    {PARAMETER_NAME_SINCE: SINCE_MONTH},
  ];

  static List<String> getFilterTimeSpanTextMap() {
    return [
      Language.current.today,
      Language.current.thisWeek,
      Language.current.thisMonth,
    ];
  }
}
