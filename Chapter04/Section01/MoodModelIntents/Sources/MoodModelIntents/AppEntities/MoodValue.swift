import AppIntents
import Foundation
import MoodModel

public struct MoodValue: AppEntity {
  public let id: Int
  public let emotionValue: Int
  public let activityDescription: String
  public let timestamp: Date
  public let detail: String
  
  public static let defaultQuery = LatestMoodsQuery()
}

extension MoodValue {
  public static var typeDisplayRepresentation: TypeDisplayRepresentation {
    TypeDisplayRepresentation("Mood Value")
  }
  
  public var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(emoji(for: emotionValue)) \(activityDescription.capitalized)",
                          subtitle: "\(detail) \n \(timestamp.description)")
  }
}
