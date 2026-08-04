import WidgetKit
import AppIntents
import SwiftUI
import MoodModelIntents

struct CreateMoodControl: ControlWidget {
  var body: some ControlWidgetConfiguration {
    StaticControlConfiguration(
      kind: "com.dimsumthinking.Moods.MoodPlus.CreateMoodControl") {
      ControlWidgetButton(action: CreateMoodIntent()) {
        Label("New mood",
              systemImage: "square.and.pencil")
      }
    }
    .displayName("New Mood")
    .description("Launches the app and navigates to the create mood sheet.")
  }
}

