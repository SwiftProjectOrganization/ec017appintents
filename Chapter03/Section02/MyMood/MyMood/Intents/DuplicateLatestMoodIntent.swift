import AppIntents
import MoodModel
import SwiftData

struct DuplicateLatestMoodIntent: AppIntent {
  static let title = LocalizedStringResource("Duplicates most recent Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent creates a duplicate of the most recent mood")
  }
  
  static let supportedModes: IntentModes = [.foreground]
  
  @Dependency
  private var navigation: NavigationManager
  
  @Dependency
  private var container: ModelContainer
  
  @MainActor
  func perform() async throws -> some IntentResult {
    navigation.navigateToRoot()
    if let mostRecent = mostRecent(for: container).first {
      navigation.path = [mostRecent]
    }
    return .result()
  }
}
