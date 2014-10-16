//
//  FirstViewController.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/11/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import UIKit
import CoreLocation

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet var tblEvents : UITableView!
    
    let lm = CLLocationManager()
    
    func findMyLocation(){
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyBest
        lm.startUpdatingLocation()
        println(lm.location)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location ")
    }
    
    func findMyTime(){
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Counts how many events there are to set the number of rows in the table
        return eventMgr.events.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
//        
//        cell.textLabel?.text = eventMgr.events[indexPath.row].title
//        cell.detailTextLabel?.text = eventMgr.events[indexPath.row].desc
        
        // TODO
        // Add values to each of the fields in the custom cell based on the info in the event struct
        var cell: EventCardCell = tableView.dequeueReusableCellWithIdentifier("cell") as EventCardCell
        
        cell.eventCardDesc.text = eventMgr.events[indexPath.row].desc
        cell.eventCardAvatar.image = UIImage(named: "avatar")
        cell.eventCardTags.text=eventMgr.events[indexPath.row].tags
//        cell.eventCardDist.text=eventMgr.events[indexPath.row].tags
        cell.eventCardDist.text = "0.1 mi"
        cell.eventCardGroupSize.text=String(eventMgr.events[indexPath.row].groupSize)
        cell.eventCardName.text=eventMgr.events[indexPath.row].name
//        cell.eventCardTime.text=eventMgr.events[indexPath.row].timePosted
        cell.eventCardTime.text = "3 min"
        
        return cell
        
        
    }
    
    // Called when user returns to this view
    override func viewWillAppear(animated: Bool) {
        tblEvents.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register custom cell
        var nib = UINib(nibName: "viewEventCardCell", bundle: nil)
        tblEvents.registerNib(nib, forCellReuseIdentifier: "cell")
        
        var inputTime = NSDate()
        var location = ["lat": 000000, "long": 0000000]
        
        eventMgr.addEvent("I want to eat at McDonalds", tags: "food", timePosted: NSDate(), groupSize: 4, lat: 0000, long: 0000, name: "Arjun", avatar: UIImage(named: "Avatar"))
        eventMgr.addEvent("Anyone want to play Smash (melee)?", tags: "games", timePosted: NSDate(), groupSize: 4, lat: 0000, long: 0000, name: "Aayush", avatar: UIImage(named: "Avatar"))
        eventMgr.addEvent("Wanna have a mini-hackathon tonight?", tags: "code, hacking", timePosted: NSDate(), groupSize: 10, lat: 0000, long: 0000, name: "Peter", avatar: UIImage(named: "Avatar"))
        eventMgr.addEvent("Let's go do some parkour!", tags: "parkour", timePosted: NSDate(), groupSize: 4, lat: 0000, long: 0000, name: "Tony", avatar: UIImage(named: "Avatar"))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

