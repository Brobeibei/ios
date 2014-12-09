//
//  SecondViewController.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/11/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var txtDesc: UITextField!
    @IBOutlet weak var txtTags: UITextField!
    @IBOutlet weak var txtLoc: UITextField!
    @IBOutlet weak var timeDate: UIDatePicker!

   
    @IBOutlet weak var txtGroup: UILabel!

    @IBOutlet weak var down: UIButton!
    @IBOutlet weak var up: UIButton!
    
    var counter = 0
    
    @IBAction func increment(sender: UIButton) {
        counter++
        txtGroup.attributedText = NSAttributedString(string: "\(counter)")
    }
    
    @IBAction func decrement(sender: AnyObject) {
        if !(counter <= 0){
            counter--
            txtGroup.attributedText = NSAttributedString(string: "\(counter)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDesc.attributedPlaceholder = NSAttributedString(string:"What's Going Down?",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        txtLoc.attributedPlaceholder = NSAttributedString(string:"Where Should I Go?",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        txtTags.attributedPlaceholder = NSAttributedString(string:"What Should I Search?",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        timeDate.backgroundColor = UIColor(red:0.953125,green:0.9375, blue: 0.87109375, alpha: 0.75)
        txtGroup.attributedText = NSAttributedString(string: "\(counter)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddEvent_Click(sender: UIButton) {
        
//        var newEvent = Event(txtDesc.text, ["hey", "hi"], Double(10010010), Int(txtLoc.text), [0.0,0.0], currentUser)
        var newEvent = Event(desc: txtDesc.text, tags: [txtTags.text], timePosted: 99999, groupSize: counter, location: [0.0,0.0], currentUser: userMgr.currentUser!)
        //replace time with parsed date time output
        eventMgr.addEventToMainStream(newEvent)
        
        self.tabBarController?.selectedIndex = 0
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    
    // UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

