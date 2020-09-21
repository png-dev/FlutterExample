import 'package:github_repo/generated/i18n.dart';

class ReposFilterParameters {
  static const PARAMETER_NAME_TYPE = "type";
  static const PARAMETER_NAME_SORT = "sort";
  static const PARAMETER_NAME_DIRECTION = "direction";

  static const TYPE_ALL = "all";
  static const TYPE_OWNER = "owner";
  static const TYPE_PUBLIC = "public";
  static const TYPE_PRIVATE = "private";
  static const TYPE_MEMBER = "member";

  static const SORT_FULL_NAME = "full_name";
  static const SORT_CREATED = "created";
  static const SORT_UPDATED = "updated";
  static const SORT_PUSHED = "pushed";

  static const DIRECTION_ASC = "asc";
  static const DIRECTION_DESC = "desc";

  static final List<String> filterTypeValueMap = [
    TYPE_ALL,
    TYPE_OWNER,
    TYPE_PUBLIC,
    TYPE_PRIVATE,
    TYPE_MEMBER
  ];

  static List<String> getFilterTypeTextMap() {
    return [
      Language.current.all,
      Language.current.owner,
      Language.current.public,
      Language.current.private,
      Language.current.member,
    ];
  }

  static List<String> getUserFilterTypeTextMap() {
    return [
      Language.current.all,
      Language.current.owner,
      Language.current.member,
    ];
  }

  static final List<Map<String, String>> filterSortValueMap = [
    {
      PARAMETER_NAME_SORT: SORT_FULL_NAME,
      PARAMETER_NAME_DIRECTION: DIRECTION_ASC
    },
    {
      PARAMETER_NAME_SORT: SORT_FULL_NAME,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
    {
      PARAMETER_NAME_SORT: SORT_CREATED,
      PARAMETER_NAME_DIRECTION: DIRECTION_ASC
    },
    {
      PARAMETER_NAME_SORT: SORT_CREATED,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
    {
      PARAMETER_NAME_SORT: SORT_UPDATED,
      PARAMETER_NAME_DIRECTION: DIRECTION_ASC
    },
    {
      PARAMETER_NAME_SORT: SORT_UPDATED,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
    {PARAMETER_NAME_SORT: SORT_PUSHED, PARAMETER_NAME_DIRECTION: DIRECTION_ASC},
    {
      PARAMETER_NAME_SORT: SORT_PUSHED,
      PARAMETER_NAME_DIRECTION: DIRECTION_DESC
    },
  ];

  static List<String> getFilterSortTextMap() {
    return [
      Language.current.fullName,
      Language.current.fullName,
      Language.current.created,
      Language.current.created,
      Language.current.updated,
      Language.current.updated,
      Language.current.pushed,
      Language.current.pushed,
    ];
  }
}
