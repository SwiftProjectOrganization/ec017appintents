import AppIntents
import MoodModel
import SwiftData

struct UpdateMoodIntent: AppIntent {
  static let title = LocalizedStringResource("Update latest Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent updates the rating for the most recent mood")
  }
  
  @MainActor
  func perform() async throws -> some IntentResult {
    // not yet implemented
    return .result()
  }
}
