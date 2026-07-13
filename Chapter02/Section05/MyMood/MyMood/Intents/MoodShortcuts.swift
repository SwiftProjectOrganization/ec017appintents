import AppIntents

struct MoodShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(intent: CreateMoodIntent(),
                phrases: [
                  "Open to Create \(.applicationName)",
                  "\(.applicationName) open and create a new mood"
                ],
                shortTitle: "New mood",
                systemImageName: "square.and.pencil")
    AppShortcut(intent: CreateWorkIntent(),
                phrases: [
                  "Open to Create Work \(.applicationName)",
                  "\(.applicationName) open and create a new work mood"
                ],
                shortTitle: "Work mood",
                systemImageName: "hammer.circle")
    AppShortcut(intent: MostRecentDetailIntent(),
                phrases: [
                  "Open latest \(.applicationName)",
                  "\(.applicationName) open to my latest mood"
                ],
                shortTitle: "Most recent",
                systemImageName: "calendar.badge")
  }
}
