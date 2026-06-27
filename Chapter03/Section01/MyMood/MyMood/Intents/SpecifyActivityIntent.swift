import AppIntents
import MoodModel

struct SpecifyActivityIntent: AppIntent {
  static let title = LocalizedStringResource("Open and Create a Mood for an Activity")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet with the activity set to one selected by the user")
  }
  
  static let supportedModes: IntentModes = [.foreground]
  
  @Dependency
  private var navigation: NavigationManager
  
  private struct ActivityProvider: DynamicOptionsProvider {
    func results() async throws -> [String] {
      ["Work", "Meetings", "Online", "Exercising", "Other"]
    }
  }
  
  @Parameter(description: "Current activity",
             optionsProvider: ActivityProvider())
  var currentActivity: String
  
  @MainActor
  func perform() async throws -> some IntentResult {
    navigation.navigateToRoot()
    navigation.currentActivity = Activity.activity(from: currentActivity)
    navigation.isCreatingMood = true
    return .result()
  }
}

