import AppIntents
import MoodModel

struct CreateTopActivityIntent: AppIntent {
  static let title = LocalizedStringResource("Open and Create a Mood for an Activity")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet with the activity set to one selected by the user")
  }
  
  static let supportedModes: IntentModes = [.foreground(.immediate)]
  
  @Dependency
  private var navigation: NavigationManager
  
  @Parameter
  private var activity: Activity
  
  @MainActor
  func perform() async throws -> some IntentResult {
    navigation.navigateToRoot()
    navigation.currentActivity = .work
    navigation.isCreatingMood = true
    return .result()
  }
}

