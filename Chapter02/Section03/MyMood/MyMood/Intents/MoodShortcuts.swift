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
  }
}
