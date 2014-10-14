//
//  EventManager.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/12/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import UIKit

var eventMgr : EventManager = EventManager()

extension NSDate {
    func toS(let format:String) -> String? {
        var formatter:NSDateFormatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.timeZone = NSTimeZone()
        formatter.dateFormat = format
        return formatter.stringFromDate(self)
    }
}

struct event{
    var desc = "No description"
    var tags = "No tags"
    var timePosted = NSDate.description()
    var groupSize = 6
    var location = ["lat": 40.110971, "long": -88.225928]
    var name = "Firstname"
    var avatar = "n/a"
    
}

class EventManager: NSObject {
    
    var events = [event]()
    
    //TODO
    // Add a function to add a new event with the information in the parameters
    
    func addEvent(desc: String, tags: String, timePosted: NSDate,
        groupSize: Int, lat: Double, long: Double, name: String, avatar: String) {
        
            var location = ["lat": lat, "long": long]
            var time = timePosted.description
            
            events.append(event(desc: desc, tags: tags, timePosted: time,
                groupSize: groupSize, location: location, name: name, avatar: avatar))
    
    }

    
//    func addEvent(title: String, desc: String) {
//        events.append(event(title: title, desc: desc))
//    }


}
