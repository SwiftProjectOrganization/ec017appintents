import SwiftUI
import MoodUI
import AppIntents

struct EmotionAdjusterView: View {
  let emotionValue: Int
}

extension EmotionAdjusterView {
  var body: some View {
    HStack {
      Button(intent: DecreaseEmotionIntent()) {
        Image(systemName: "minus.circle")
          .font(.largeTitle)
      }
      Head200(emotionValue: emotionValue)
      Button(intent: IncreaseEmotionIntent()) {
        Image(systemName: "plus.circle")
          .font(.largeTitle)
      }
    }
  }
}
