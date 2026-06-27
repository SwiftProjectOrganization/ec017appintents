import AppIntents
import MoodModel
import MoodModelIntents

struct SpecifyActivityIntent: AppIntent {
  static let title = LocalizedStringResource("Open and Create a Mood for an Activity and Emotion")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet with the activity and emotion set to one selected by the user")
  }
  
  static var parameterSummary: some ParameterSummary {
    Summary("Record Mood for \(\.$currentActivity) while feeling \(\.$currentEmotion).")
  }
  
  static let supportedModes: IntentModes = [.foreground]
  
  @Dependency
  private var navigation: NavigationManager
  
  @Parameter(description: "Current activity",
             requestValueDialog: IntentDialog("Select an activity:"))
   var currentActivity: CommonActivity
  
  @Parameter(description: "Current emotion",
             requestValueDialog: "How are you feeling?")
   var currentEmotion: Emotion
  
  @MainActor
  func perform() async throws -> some IntentResult {
    navigation.navigateToRoot()
    navigation.currentActivity = currentActivity.activity
    navigation.currentEmotion = currentEmotion
    navigation.isCreatingMood = true
    return .result()
  }
}

