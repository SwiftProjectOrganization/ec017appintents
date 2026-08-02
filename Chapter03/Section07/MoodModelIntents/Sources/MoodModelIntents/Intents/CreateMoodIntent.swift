import AppIntents

public struct CreateMoodIntent: TargetContentProvidingIntent {
  public init() {}
  
  public static let title = LocalizedStringResource("Open to Create Mood")
  
  public static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet")
  }
  
  public static let supportedModes: IntentModes = [.foreground]
}

