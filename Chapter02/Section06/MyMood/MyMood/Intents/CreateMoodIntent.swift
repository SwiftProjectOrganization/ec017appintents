import AppIntents

struct CreateMoodIntent: TargetContentProvidingIntent {
  static let title = LocalizedStringResource("Open to Create Mood")
  
  static var description: IntentDescription? {
    IntentDescription("This intent launches the app and navigates to the create mood sheet")
  }
  
  static let supportedModes: IntentModes = [.foreground]
}

