//
//  FirstViewController.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/11/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import UIKit
import CoreLocation
import AlamoFire

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    
    var eventData = []
    
    @IBOutlet var tblEvents : UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return eventData.count
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: EventCardCell = tableView.dequeueReusableCellWithIdentifier("mainEventCell") as EventCardCell
        
        var index = indexPath.row
        
        var name = eventData[index]["name"] as String
        cell.eventCardName.text = "\(name)"
        
        var desc = eventData[index]["description"]
        
        cell.eventCardDesc.text = "hey"
        
//        var tags = eventData[index]["tags"] as NSArray
        
//        cell.eventCardTags.text = "\(tags)"
        
        var time = eventData[index]["date"]
        cell.eventCardTime.text = "\(time)"
        
        var lat = eventData[index]["location"]
        var lng = eventData[index]["location"]
        var loc = "\(lat), \(lng)"
        cell.eventCardDist.text = "\(loc)"

        var groupSize = eventData[index]["maxSize"] as Int
        cell.eventCardGroupSize.text = "0/\(groupSize)"
        
        
        
        
        
        return cell
        
        
    }
    
    // Called when user returns to this view
    override func viewWillAppear(animated: Bool) {
        tblEvents.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEventData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getEventData() {
        let mySession = NSURLSession.sharedSession()
        let url : NSURL = NSURL(string: "https://cs196-cliq.herokuapp.com/api/events")!
        let networkTask = mySession.dataTaskWithURL(url, completionHandler : {data, response, error -> Void in
            
            var err : NSError?
            var eventJSON = NSJSONSerialization.JSONObjectWithData(data, options: nil, error : &err) as NSArray
            
            for index in 0...eventJSON.count-1 {
                println("EVENT \(index + 1): \(eventJSON[index])")
                println("========================================")
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.eventData = eventJSON
                self.tblEvents!.reloadData()
            })
            
        })
        
        networkTask.resume()
    }
    
    
}

