import AppIntents
import MoodModel
import SwiftData

public struct UpdateMoodIntent: AppIntent {
  public init() {}
  
  public static let title = LocalizedStringResource("Update latest Mood")
  
  public static var description: IntentDescription? {
    IntentDescription("This intent updates the rating for the most recent mood")
  }
  
  @MainActor
  public func perform() async throws -> some IntentResult {
    // not yet implemented
    return .result()
  }
}
