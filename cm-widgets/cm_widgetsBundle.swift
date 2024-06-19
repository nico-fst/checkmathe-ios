//
//  cm_widgetsBundle.swift
//  cm-widgets
//
//  Created by Nico Stern on 19.06.24.
//

import WidgetKit
import SwiftUI

@main
struct cm_widgetsBundle: WidgetBundle {
    var body: some Widget {
        cm_widgets()
        cm_widgetsLiveActivity()
    }
}
