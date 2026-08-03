import AppIntents
import MoodModelIntents

struct MoodShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(intent: CreateMoodIntent(),
                phrases: [
                  "Open and Create \(.applicationName)",
                ],
                shortTitle: "New mood",
                systemImageName: "square.and.pencil")

    AppShortcut(intent: DuplicateRecentMoodIntent(),
                phrases: [
                  "Duplicate recent \(.applicationName)"
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
