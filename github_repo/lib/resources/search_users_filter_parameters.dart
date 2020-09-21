import 'package:github_repo/generated/i18n.dart';

class SearchUsersFilterParameters {
  static const PARAMETER_NAME_SORT = "sort";
  static const PARAMETER_NAME_DIRECTION = "direction";
  static const DIRECTION_ASC = "asc";
  static const DIRECTION_DESC = "desc";

  static const SORT_BEST_MATCH = '';
  static const SORT_FOLLOWERS = 'followers';
  static const SORT_JOINED = 'joined';
  static const SORT_REPOSITORIES = 'repositories';

  static final List<Map<String, String>> filterSortValueMap = [
    {
      PARAMETER_NAME_SORT: SORT_BEST_MATCH,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
    {
      PARAMETER_NAME_SORT: SORT_FOLLOWERS,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
    {
      PARAMETER_NAME_SORT: SORT_FOLLOWERS,
      PARAMETER_NAME_DIRECTION: DIRECTION_ASC
    },
    {
      PARAMETER_NAME_SORT: SORT_JOINED,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
    {PARAMETER_NAME_SORT: SORT_JOINED, PARAMETER_NAME_DIRECTION: DIRECTION_ASC},
    {
      PARAMETER_NAME_SORT: SORT_REPOSITORIES,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
    {
      PARAMETER_NAME_SORT: SORT_REPOSITORIES,
      PARAMETER_NAME_DIRECTION: DIRECTION_ASC
    },
  ];

  static List<String> getFilterSortTextMap() {
    return [
      Language.current.bestMatch,
      Language.current.searchSortFollowers,
      Language.current.searchSortFollowers,
      Language.current.searchSortJoined,
      Language.current.searchSortJoined,
      Language.current.searchSortRepositories,
      Language.current.searchSortRepositories,
    ];
  }
}
