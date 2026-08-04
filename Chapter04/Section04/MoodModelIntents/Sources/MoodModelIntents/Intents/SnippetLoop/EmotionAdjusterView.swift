import SwiftUI
import MoodUI

struct EmotionAdjusterView: View {
  let emotionValue: Int
}

extension EmotionAdjusterView {
  var body: some View {
    HStack {
      Button(action: {}) {
        Image(systemName: "minus.circle")
          .font(.largeTitle)
      }
      Head200(emotionValue: emotionValue)
      Button(action: {}) {
        Image(systemName: "plus.circle")
          .font(.largeTitle)
      }
    }
  }
}
