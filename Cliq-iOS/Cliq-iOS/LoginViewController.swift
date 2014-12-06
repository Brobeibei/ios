//
//  LoginViewController.swift
//  Cliq-iOS
//
//  Created by Arjun Sarode on 10/11/14.
//  Copyright (c) 2014 Cliq. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBLoginViewDelegate {
    
   // @IBOutlet var fbLoginView : FBLoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var currentUser : User = User(name: ["first", "last"], location: [0.0, 0.0])
        userMgr.currentUser = currentUser
        
        
        //self.fbLoginView.delegate = self
        //self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
    }
    
    // Facebook delegate methods
    
    //func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
      //  println("User Logged In")
       //self .performSegueWithIdentifier("loggedIn", sender: self)
        // show the next view
        //println("This is where you perform a segue.")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        println("User Name: \(user.name)")
        println(user)
    
        // TODO
        // send a request with the current user's Facebook ID
        // if the id is registered in our database of users, initalize a currentUser object with the logged in user's information
        // if the id is not registered, add the user and their info to the database and then initalize a currentUser object with that info
        
        
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    //override func didReceiveMemoryWarning() {
      //  super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    //}
    
    
//}