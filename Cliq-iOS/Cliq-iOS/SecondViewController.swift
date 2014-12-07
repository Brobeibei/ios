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
    @IBOutlet weak var txtGroup: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtDesc.attributedPlaceholder = NSAttributedString(string:"What's Going Down?",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        txtGroup.attributedPlaceholder = NSAttributedString(string:"How Crowded Is This?",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
        txtTags.attributedPlaceholder = NSAttributedString(string:"What Should I Search?",
            attributes:[NSForegroundColorAttributeName: UIColor.grayColor()])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddEvent_Click(sender: UIButton) {
        
//        var newEvent = Event(txtDesc.text, ["hey", "hi"], Double(10010010), Int(txtGroup.text), [0.0,0.0], currentUser)
        var newEvent = Event(desc: txtDesc.text, tags: ["1","2"], timePosted: 99999, groupSize: 1, location: [0.0,0.0], currentUser: userMgr.currentUser!)
        
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

