//
//  Remove_FormatApp.swift
//  Remove Format
//
//  Created by j1 on 2023/1/10.
//

import SwiftUI

@main
struct Remove_FormatApp: App {
    @StateObject var eventData = EventData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(eventData)
        }
    }
}
