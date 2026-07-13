import AppIntents

struct MoodShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(intent: CreateMoodIntent(),
                phrases: [
                  "Open and Create \(.applicationName)",
                  "\(.applicationName) open and create a new mood"
                ],
                shortTitle: "New mood",
                systemImageName: "square.and.pencil")
    AppShortcut(intent: SpecifyActivityIntent(),
                phrases: [
                  "Open and Create \(.applicationName) for specified activity",
                  "\(.applicationName) open and request activity to create a new mood",
                  "\(.applicationName) use \(\.$currentActivity) to create a new mood",
                  "\(.applicationName) use \(\.$currentEmotion) to create a new mood",
                ],
                shortTitle: "Mood while...",
                systemImageName: "person.badge.shield.checkmark")
    AppShortcut(intent: DuplicateRecentMoodIntent(),
                phrases: [
                  "Duplicate the latest \(.applicationName)",
                  "\(.applicationName) duplicate the latest mood"
                ],
                shortTitle: "Most recent",
                systemImageName: "calendar.badge.plus")
  }
}
