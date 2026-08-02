import AppIntents

public struct DuplicateLatestMoodIntent: AppIntent {
  public init() {}
  
  public static let title = LocalizedStringResource("Duplicates latest Mood")
  
  public static var description: IntentDescription? {
    IntentDescription("This intent creates a duplicate of the most recent mood")
  }
  
  public static let supportedModes: IntentModes = [.foreground]
  
  @MainActor
  public func perform() async throws -> some IntentResult {
    return .result()
  }
}
