public let emojis = ["😢","☹️", "😐", "😊", "😁"]

public func emoji(for emotionValue: Int) -> String {
  switch emotionValue {
  case ...(0): "😢"
  case 4...: "😁"
  default: emojis[emotionValue]
  }
}

