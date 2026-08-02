import AppIntents
import MoodModel
import SwiftData

public struct EmotionMoodQuery: EntityQuery {
  public init(){}
  
  @Dependency
  private var container: ModelContainer
  
  @MainActor
  public func entities(for identifiers: [Int]) async throws -> [MoodValue] {
    moods(for: container,
          matching: identifiers)
    .map(\.value)
  }
  
  @MainActor
  public func suggestedEntities() async throws ->  IntentItemCollection<MoodValue> {
    ItemCollection {
      ItemSection<MoodValue>("Happy",
                             items: mostRecent(2, for: container,
                                               emotionFilter: .isHappy)
                              .map {IntentItem<MoodValue>($0.value)})
      ItemSection<MoodValue>("OK",
                             items: mostRecent(1, for: container,
                                               emotionFilter: .isOK)
                              .map {IntentItem<MoodValue>($0.value)})
      ItemSection<MoodValue>("Sad",
                             items: mostRecent(2, for: container,
                                               emotionFilter: .isSad)
                              .map {IntentItem<MoodValue>($0.value)})
    }
  }
}

