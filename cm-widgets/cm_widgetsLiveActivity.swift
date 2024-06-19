//
//  cm_widgetsLiveActivity.swift
//  cm-widgets
//
//  Created by Nico Stern on 19.06.24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct cm_widgetsAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct cm_widgetsLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: cm_widgetsAttributes.self) { context in
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

extension cm_widgetsAttributes {
    fileprivate static var preview: cm_widgetsAttributes {
        cm_widgetsAttributes(name: "World")
    }
}

extension cm_widgetsAttributes.ContentState {
    fileprivate static var smiley: cm_widgetsAttributes.ContentState {
        cm_widgetsAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: cm_widgetsAttributes.ContentState {
         cm_widgetsAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: cm_widgetsAttributes.preview) {
   cm_widgetsLiveActivity()
} contentStates: {
    cm_widgetsAttributes.ContentState.smiley
    cm_widgetsAttributes.ContentState.starEyes
}
