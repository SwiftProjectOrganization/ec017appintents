//
//  MyMoodPlusLiveActivity.swift
//  MyMoodPlus
//
//  Created by Daniel Steinberg on 8/2/26.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct MyMoodPlusAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct MyMoodPlusLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MyMoodPlusAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension MyMoodPlusAttributes {
    fileprivate static var preview: MyMoodPlusAttributes {
        MyMoodPlusAttributes(name: "World")
    }
}

extension MyMoodPlusAttributes.ContentState {
    fileprivate static var smiley: MyMoodPlusAttributes.ContentState {
        MyMoodPlusAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: MyMoodPlusAttributes.ContentState {
         MyMoodPlusAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: MyMoodPlusAttributes.preview) {
   MyMoodPlusLiveActivity()
} contentStates: {
    MyMoodPlusAttributes.ContentState.smiley
    MyMoodPlusAttributes.ContentState.starEyes
}
