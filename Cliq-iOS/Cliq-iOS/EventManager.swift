//
//  EventManager.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/12/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import Foundation

var eventMgr : EventManager = EventManager()

//struct event{
//    var desc = "No description"
//    var tags = "No tags" //array of strings
//    var timePosted = NSDate.description() //double for seconds from 1970
//    var groupSize = 6
//    var location = ["lat": 0.0, "long": 0.0]
//    var name = "Firstname"
//    var avatar = UIImage(named: "avatar")
//    
//    // attendees: array of users, the first attendee will be designated as the 'owner'
//}


// USER MODEL
// Name : String
// radius : Int
// their location  : array of [0]lat,[1]long
// rating : Double between 0-1
// events : array of events they have attended, if event date is positive, it is an event they will attend in the future


class EventManager: NSObject {
    
    var eventStream = [Event]()
    
    func addEventToMainStream(event : Event) {
        eventStream.append(event);
    }
    
    func requestToJoinEvent(user, User, event : Event) {
        
    }
    
    func acceptRequest(user : User, event: Event) {
        
    }
    
    func declineRequest(user : User, event : Event) {
        
    }
    
    func editEvent(event : Event) {
        
    }

}
