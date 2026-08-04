import AppIntents
import MoodModel
import SwiftData

public struct DuplicateRecentMoodIntent: AppIntent {
  public init() {}
  
  public static let title = LocalizedStringResource("Duplicates a recent Mood")
  
  public static var description: IntentDescription? {
    IntentDescription("This intent creates a duplicate of a recent mood")
  }
  
  @Dependency
  private var container: ModelContainer
  
  @Parameter(description: "Recent mood",
             requestValueDialog: "Select a recent mood",
             query: EmotionMoodQuery())
  public var moodValue: MoodValue
  
  @MainActor
  public func perform() async throws -> some ProvidesDialog & ReturnsValue<String> {
    let newEntry = MoodEntry(value: moodValue)
    newEntry.timestamp = Date.now
    let context = container.mainContext
    context.insert(newEntry)
    try context.save()
    return .result(value: newEntry.activityDescription + " (" + newEntry.detail + ")",
                   dialog:"Created \(newEntry.emoji) \(newEntry.activityDescription)")
  }
}
