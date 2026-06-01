public let activityDescriptions = Activity.allCases.map(\.rawValue)
public let activities = Activity.allCases
public let defaultActivity = Activity.noneChosen

public enum Activity: String, Codable, Equatable, Sendable, CaseIterable {
  case noneChosen = "<   >"
  case work
  case email
  case online
  case meetings
  case friends
  case shopping
  case finances
  case leisure
  case exercising
  case chores
  case rest
  case other
  
  public static func activity(from activityDescription: String) -> Activity {
    Activity(rawValue: activityDescription.lowercased()) ?? .other
  }
}

extension Activity: Identifiable {
  public var id: Self {
    self
  }
}

extension Activity: CustomStringConvertible {
  public var description: String {
    rawValue
  }
}

import AppIntents

extension Activity: AppEnum {
  public static var typeDisplayRepresentation: TypeDisplayRepresentation {
    TypeDisplayRepresentation("All available activities")
  }
  public static var caseDisplayRepresentations: [Activity : DisplayRepresentation] {
    [.noneChosen: "<...>",
     .work: "Work",
     .email: "Email",
     .online: "Online",
     .meetings: "Meetings",
     .friends: "Friends",
     .shopping: "Shopping",
     .finances: "Finances",
     .leisure: "Leisure",
     .exercising: "Exercising",
     .chores: "Chores",
     .rest: "Rest",
     .other: "Other"
    ]
  }
}



