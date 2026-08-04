import AppIntents
import MoodModel
import SwiftData

struct IncreaseEmotionIntent: AppIntent {
  
  static let title: LocalizedStringResource = "Increase emotion"
  
  static let isDiscoverable: Bool = false
  
  @Dependency
  private var container: ModelContainer
  
  @MainActor
  func perform() async throws -> some IntentResult {
    let adjustableMood = mostRecent(for: container).first!
    adjustableMood.emotionValue = min(adjustableMood.emotionValue + 1, 4)
    try container.mainContext.save()
    return .result()
  }
}

