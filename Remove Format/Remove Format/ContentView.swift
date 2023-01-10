//
//  ContentView.swift
//  Remove Format
//
//  Created by j1 on 2023/1/10.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var eventData:EventData
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        TextEditor(text: $eventData.event.text)
            .onChange(of: scenePhase, perform: {phase in
                if phase == .active{
                    if let loadedEvent = Event.loadEvent(){
                        eventData.event = loadedEvent
                    }
                }
                if phase == .inactive{
                    Event.saveEvent(event: eventData.event)
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
