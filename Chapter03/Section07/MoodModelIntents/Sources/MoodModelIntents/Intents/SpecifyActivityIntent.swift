import AppIntents
import MoodModel
import SwiftData

public struct SpecifyActivityIntent: AppIntent {
  public init() {}
  
  public static let title = LocalizedStringResource("Create Mood for Activity and Emotion")
  
  public static var description: IntentDescription? {
    IntentDescription("Create a mood with the activity and emotion set to one selected by the user")
  }
  
  public static var parameterSummary: some ParameterSummary {
    Summary("Record Mood for \(\.$currentActivity) while feeling \(\.$currentEmotion) with \(\.$moodDetail).")
  }
  
  @Dependency
  private var container: ModelContainer
  
  @Parameter(description: "Current activity",
             requestValueDialog: IntentDialog("Select an activity:"))
   public var currentActivity: CommonActivity
  
  @Parameter(description: "Current emotion",
             requestValueDialog: "How are you feeling?")
   public var currentEmotion: Emotion
  
  @Parameter(description: "Mood detail",
             requestValueDialog: "Add something about now.")
  public var moodDetail: String?
  
  @MainActor
  public func perform() async throws -> some IntentResult & ProvidesDialog {
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

