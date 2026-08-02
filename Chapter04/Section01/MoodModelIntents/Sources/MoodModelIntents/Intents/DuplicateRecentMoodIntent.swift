import AppIntents

public struct DuplicateRecentMoodIntent: AppIntent {
  public init() {}
  
  public static let title = LocalizedStringResource("Duplicates a recent Mood")
  
  public static var description: IntentDescription? {
    IntentDescription("This intent creates a duplicate of a recent mood")
  }
  
  @Parameter(description: "Recent mood",
             requestValueDialog: "Select a recent mood")
  public var moodValue: MoodValue
  
  @MainActor
  public func perform() async throws -> some IntentResult {
    return .result()
  }
}
