import MoodModel
import AppIntents

public enum CommonActivity: String {
  case work
  case meetings
  case online
  case exercising
  case other
}

extension CommonActivity {
  public var activity: Activity {
    switch self {
    case .work: .work
    case .meetings: .meetings
    case .online: .online
    case .exercising: .exercising
    case .other: .other
    }
  }
}

extension CommonActivity: AppEnum {
  public static var typeDisplayRepresentation: TypeDisplayRepresentation {
    TypeDisplayRepresentation("An enum containing the most common activities")
  }
  
  public static var caseDisplayRepresentations: [CommonActivity : DisplayRepresentation] {
    [.work: "Work",
     .meetings: "Meetings",
     .online: "Online",
     .exercising: "Exercising",
     .other: "Other"]
  }
}
