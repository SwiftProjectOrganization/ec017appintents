import SwiftData
import Foundation

@MainActor
public func moods(for container: ModelContainer) -> [MoodEntry] {
  let context = container.mainContext
  let sortDescriptor = [SortDescriptor(\MoodEntry.timestamp,
                                        order: .reverse)]
  let fetchDescriptor = FetchDescriptor<MoodEntry>(sortBy: sortDescriptor)
  return (try? context.fetch(fetchDescriptor)) ?? [MoodEntry]()
}

@MainActor
public func mostRecent(_ number: Int = 1,
                       for container: ModelContainer,
                       emotionFilter: EmotionFilter = .isAny,
                       activityFilter: ActivityFilter = .isAny) -> [MoodEntry] {
  Array(moods(for: container)
    .filter(emotionFilter.mood)
    .filter(activityFilter.mood)
    .prefix(number))
}

@MainActor
public func moods(for container: ModelContainer,
                      matching identifiers: [Int] ) -> [MoodEntry] {
  moods(for: container)
    .filter { identifiers.contains($0.persistentModelID.id.hashValue)}
}



