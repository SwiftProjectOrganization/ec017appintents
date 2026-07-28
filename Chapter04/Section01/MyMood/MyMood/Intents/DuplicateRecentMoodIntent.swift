import AppIntents
import MoodModel
import SwiftData
import MoodModelIntents

struct DuplicateRecentMoodIntent: AppIntent {
  static let title = LocalizedStringResource("Duplicates a recent Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent creates a duplicate of a recent mood")
  }
  
  @Parameter(description: "Recent mood",
             requestValueDialog: "Select a recent mood")
  var moodValue: MoodValue
  
  @MainActor
  func perform() async throws -> some IntentResult {
    return .result()
  }
}
