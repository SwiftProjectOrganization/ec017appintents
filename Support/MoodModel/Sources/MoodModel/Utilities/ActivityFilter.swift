public enum ActivityFilter {
  case isActivity(Activity)
  case isAny
}

extension ActivityFilter {
  public var mood: (MoodEntry) -> Bool {
    switch self {
    case .isActivity(let activity): {mood in
      mood.activity == activity
    }
    case .isAny: {_ in true}
    }
  }
}

extension ActivityFilter {
  public static func filter(for activity: Activity?) -> Self {
    if let activity {
      return .isActivity(activity)
    } else {
      return .isAny
    }
  }
}

