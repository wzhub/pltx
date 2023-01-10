//
//  Event.swift
//  Remove Format
//
//  Created by j1 on 2023/1/10.
//

import Foundation
struct Event:Codable{
    var text:String
    static let documentLibray = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentLibray.appendingPathComponent("Event").appendingPathExtension("plist")
    static func loadEvent()->Event?{
        guard let codedEvent = try?Data(contentsOf: archiveURL)else{return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try?propertyListDecoder.decode(Event.self, from: codedEvent)
    }
    static func saveEvent(event:Event){
        let propertyListEncoder = PropertyListEncoder()
        let codedEvent = try?propertyListEncoder.encode(event)
        try?codedEvent?.write(to: archiveURL,options: .noFileProtection)
    }
}
