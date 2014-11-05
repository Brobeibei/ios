//
//  Event.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/28/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import Foundation

class Event : NSObject {
    
//  CLASS VARIABLES

    var desc = "No description"
    var tags = []
    var timePosted = NSDate().timeIntervalSince1970
    var groupSize = 6
    var location = [0.0, 0.0] // [lat, long]
    var dateOfEvent = NSDate().timeIntervalSince1970
    var id : Double = 0
    var userList = [userMgr.currentUser, userMgr.currentUser, userMgr.currentUser]
    var requestList = [User]()
    var declinedList = [User]()
    
    var creator : User
    
    
//  INITIALIZER
    
    init(desc: String, tags : [String], timePosted : Double, groupSize : Int, location : [Double], currentUser: User ) {
        
        self.desc = desc
        self.tags = tags
        self.timePosted = timePosted
        self.groupSize = groupSize
        self.location = location
        
        // Send a request to generate a unique id for the event
        self.id = 0
        
        self.userList = [currentUser]
        self.creator = currentUser
    }
    

//  CLASS METHODS
    func addRequest(user : User) {
        self.requestList.append(user)
    }
    
    func acceptRequest(user : User) {
        // TODO remove the user from the requestList
        
        self.userList.append(user)
    }
    
    func declineRequest(user : User) {
        // TODO remove the user from the requestList
        
        self.declinedList.append(user)
    }
    
    func editEvent(desc: String, tags : [String], groupSize : Int) {
        self.desc = desc
        self.tags = tags
        self.groupSize = groupSize

    }

    
    

}
