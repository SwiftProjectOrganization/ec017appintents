import AppIntents
import MoodModel
import SwiftData

struct DuplicateRecentMoodIntent: AppIntent {
  static let title = LocalizedStringResource("Duplicates a recent Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent creates a duplicate of a recent mood")
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
