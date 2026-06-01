import AppIntents
import MoodModel
import MoodModelIntents

struct SpecifyActivityIntent: AppIntent {
  static let title = LocalizedStringResource("Open and Create a Mood for an Activity")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet with the activity set to one selected by the user")
  }
  
  static let supportedModes: IntentModes = [.foreground]
  
  @Dependency
  private var navigation: NavigationManager
  
  @Parameter(description: "Current activity",
             requestValueDialog: IntentDialog("Select an activity:"))
  private var currentActivity: CommonActivity
  
  @Parameter(description: "Current emotion",
             inclusiveRange: (lowerBound: 0, upperBound: 4),
             requestValueDialog: "How are you feeling (0-4)")
  private var currentEmotion: Int
  
  @MainActor
  func perform() async throws -> some IntentResult {
    navigation.navigateToRoot()
    navigation.currentActivity = currentActivity.activity
    navigation
    navigation.isCreatingMood = true
    return .result()
  }
}

