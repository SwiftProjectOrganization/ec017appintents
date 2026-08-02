import AppIntents
import MoodModel
import SwiftData

public struct LatestMoodsQuery: EntityQuery {
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
  public func suggestedEntities() async throws -> [MoodValue] {
    mostRecent(5, for: container)
      .map(\.value)
  }
}

