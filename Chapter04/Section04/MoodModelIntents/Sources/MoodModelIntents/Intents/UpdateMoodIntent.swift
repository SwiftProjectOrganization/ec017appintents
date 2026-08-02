import AppIntents
import MoodModel
import SwiftData
import SwiftUI

public struct UpdateMoodIntent: AppIntent {
  public init() {}
  
  public static let title = LocalizedStringResource("Update latest Mood")
  
  public static var description: IntentDescription? {
    IntentDescription("This intent updates the rating for the most recent mood")
  }
  
  @Dependency
  private var container: ModelContainer
  
  @MainActor
  public func perform() async throws -> some ProvidesDialog & ShowsSnippetView {
    let latestEntry = mostRecent(for: container).first!
    let newEntry = MoodEntry(mood: latestEntry)
    newEntry.timestamp = Date.now
    try await requestConfirmation(dialog: "Duplicate and update \(newEntry.emoji) \(newEntry.activityDescription)?")
    let context = container.mainContext
    context.insert(newEntry)
    try context.save()
    return .result(dialog: "Updating \(newEntry.activityDescription.capitalized) (\(newEntry.detail))",
                   view: EmotionAdjusterView(emotionValue: newEntry.emotionValue))
  }
}
