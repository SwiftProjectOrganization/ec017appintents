import WidgetKit
import SwiftUI

@main
struct MyMoodPlusBundle: WidgetBundle {
  var body: some Widget {
    MyMoodPlus()
    CreateMoodControl()
    MyMoodPlusLiveActivity()
  }
}
