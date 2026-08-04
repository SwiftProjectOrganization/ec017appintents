import AppIntents
import MoodModel
import SwiftData

struct DecreaseEmotionIntent: AppIntent {
  
  static let title: LocalizedStringResource = "Decrease emotion"
  
  static let isDiscoverable: Bool = false
  
  @Dependency
  private var container: ModelContainer
  
  @MainActor
  func perform() async throws -> some IntentResult {
    let adjustableMood = mostRecent(for: container).first!
    adjustableMood.emotionValue = max(adjustableMood.emotionValue - 1, 0)
    try container.mainContext.save()
    return .result()
  }
}

