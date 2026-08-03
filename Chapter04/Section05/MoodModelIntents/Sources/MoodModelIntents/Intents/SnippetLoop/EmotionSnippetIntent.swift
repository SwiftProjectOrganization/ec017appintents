import AppIntents
import MoodModel
import SwiftData
import SwiftUI

struct EmotionSnippetIntent: SnippetIntent {
  static let title: LocalizedStringResource = "Emotion Adjuster Snippet"
  
  @Dependency
  private var container: ModelContainer
  
  @MainActor
  func perform() async throws -> some ShowsSnippetView {
    let adjustableMood = mostRecent(for: container).first!
    let view = EmotionAdjusterView(emotionValue: adjustableMood.emotionValue)
    return .result(view: view)
  }
}

