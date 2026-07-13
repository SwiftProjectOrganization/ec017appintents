import AppIntents
import MoodModel
import MoodModelIntents
import SwiftData

struct SpecifyActivityIntent: AppIntent {
  static let title = LocalizedStringResource("Create Mood for Activity and Emotion")
  
  static var description: IntentDescription? {
    IntentDescription("Create a mood with the activity and emotion set to one selected by the user")
  }
  
  static var parameterSummary: some ParameterSummary {
    Summary("Record Mood for \(\.$currentActivity) while feeling \(\.$currentEmotion) with \(\.$moodDetail).")
  }
  
  @Dependency
  private var container: ModelContainer
  
  @Parameter(description: "Current activity",
             requestValueDialog: IntentDialog("Select an activity:"))
   var currentActivity: CommonActivity
  
  @Parameter(description: "Current emotion",
             requestValueDialog: "How are you feeling?")
   var currentEmotion: Emotion
  
  @Parameter(description: "Mood detail",
             requestValueDialog: "Add something about now.")
  var moodDetail: String?
  
  @MainActor
  func perform() async throws -> some IntentResult & ProvidesDialog {
    let context = container.mainContext
    let entry = MoodEntry(emotion: currentEmotion,
                          activity: currentActivity.activity,
                          detail: moodDetail ?? "(No detail provided)",
                          timestamp: Date.now)
    context.insert(entry)
    try context.save()
    return .result(dialog:"Created MoodEntry \(currentEmotion.emoji) \(currentActivity.rawValue)")
  }
}

