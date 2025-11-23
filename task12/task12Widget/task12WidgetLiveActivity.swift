//
//  task12WidgetLiveActivity.swift
//  task12Widget
//
//  Created by İlknur Tulgar on 23.11.2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct task12WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct task12WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: task12WidgetAttributes.self) { context in
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

extension task12WidgetAttributes {
    fileprivate static var preview: task12WidgetAttributes {
        task12WidgetAttributes(name: "World")
    }
}

extension task12WidgetAttributes.ContentState {
    fileprivate static var smiley: task12WidgetAttributes.ContentState {
        task12WidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: task12WidgetAttributes.ContentState {
         task12WidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: task12WidgetAttributes.preview) {
   task12WidgetLiveActivity()
} contentStates: {
    task12WidgetAttributes.ContentState.smiley
    task12WidgetAttributes.ContentState.starEyes
}
