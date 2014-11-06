//
//  User.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/28/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import Foundation

class User : NSObject {
    
    
//  CLASS VARIABLES
    
    var name = ["firstname", "lastname"]
    var avatar = UIImage(named: "avatar")
    var bio = "add a bio here"
    var radius = 10.0
    var location = [0.0, 0.0] // [lat, long]
    var rating = 1.0
    var joinedEvents = [Event]()
    var requestedEvents = [Event]()
    var eventList = [Event]()
    
    init(name: [String], location: [Double]) {
        self.name = name
        self.bio = "add a bio here"
        
        // User Facebook API to get the user's profile picture
        self.avatar = UIImage(named: "avatar")
        
        self.radius = 10.0
        self.location = location
        self.rating = 1.0
        
        // Call to backend to grab array of event objects
        var eventList = [Event]()
    }
    
    func edit(location: [Double], bio: String, radius: Double) {
        self.location = location
        self.bio = bio
        self.radius = radius
    }
    
    func requestToJoinEvent(event: Event) {
         self.requestedEvents.append(event)
    }
    
    func addJoinedEvent(event: Event) {
         self.joinedEvents.append(event)
    }
    

}