import MoodModel

extension MoodEntry {
  convenience public init(value: MoodValue) {
    self.init(emotion: Emotion(value: value.emotionValue),
              activity: Activity.activity(from: value.activityDescription),
              detail: value.detail,
              timestamp: value.timestamp)
  }
}

extension MoodEntry {
  public var value: MoodValue {
    MoodValue(id: persistentModelID.id.hashValue,
              emotionValue: emotionValue,
              activityDescription: activityDescription,
              timestamp: timestamp,
              detail: detail)
  }
}


