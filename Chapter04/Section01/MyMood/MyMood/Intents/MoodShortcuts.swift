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

    AppShortcut(intent: DuplicateRecentMoodIntent(),
                phrases: [
                  "Duplicate the latest \(.applicationName)",
                  "\(.applicationName) duplicate the latest mood"
                ],
                shortTitle: "Most recent",
                systemImageName: "calendar.badge.plus")
    
    AppShortcut(intent: UpdateMoodIntent(),
                phrases: [
                  "Update latest \(.applicationName)"
                ],
                shortTitle: "Update latest",
                systemImageName: "arrow.clockwise.circle")
  }
}
