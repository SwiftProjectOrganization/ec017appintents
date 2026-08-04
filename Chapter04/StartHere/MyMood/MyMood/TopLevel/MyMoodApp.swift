import SwiftUI
import SwiftData
import MoodModel
import AppIntents
import MoodModelIntents

@main
struct MyMoodApp: App {
  @State var navigation = NavigationManager()
  @State var modelContainer: ModelContainer
  
  init() {
    let modelContainer = {
      do {
        return try ModelContainer(for: MoodEntry.self)
      } catch {
        fatalError("Couldn't create container for MoodEntry")
      }
    }()
    self.modelContainer = modelContainer
    AppDependencyManager.shared.add(dependency: modelContainer)
  }
}

extension MyMoodApp {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onAppIntentExecution(CreateMoodIntent.self) {_ in
          navigation.navigateToRoot()
          navigation.isCreatingMood = true
        }
    }
    .modelContainer(modelContainer)
    .environment(navigation)
  }
}
