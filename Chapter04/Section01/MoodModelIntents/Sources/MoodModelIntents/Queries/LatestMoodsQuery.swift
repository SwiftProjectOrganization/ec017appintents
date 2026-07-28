import AppIntents

public struct LatestMoodsQuery: EntityQuery {
  public init(){}
  
  public func entities(for identifiers: [Int]) async throws -> [MoodValue] {
    [MoodValue]()
  }
}
