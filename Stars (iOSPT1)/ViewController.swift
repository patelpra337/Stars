//
//  ViewController.swift
//  Stars (iOSPT1)
//
//  Created by patelpra on 5/9/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 16. Load all the stars as the app starts up, Call the method --> listStars
        self.listStars()
        // 19. Load the TextFields, Call the method --> clearInput
        self.clearInput()
        
    }

    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var starsTextView: UITextView!
    
    // 5.  Create instance variable of which will setup an empty array of [Star] and initialze it
    let starController = StarController()
    
    // 6.  Next we are going to create a star we need to get the name (String), distance (Double).  Text field text will always be a String and we will need a conversion by using guard let statement.  Create let constant name, distanceString, & distance.  The last let constant we are converting to a string.  We are using the two of the IBOutlets with the let constant.
    @IBAction func starsTextView(_ sender: Any) {
        guard let name = starNameTextField.text,
            let distanceString = distanceTextField.text,
            let distance = Double(distanceString) else { return }
        
    // 7.  What we need to do now is, add the starController.addStar button
        self.starController.addStar(named: name, withDistance: distance)
    // 9.  Call the func listStars
        self.listStars()
    }
    
    // 8.  List all of the stars we're tracking by creating a func --> Create a string; Append text about the star by creating a for in loop; Display it in textview
    private func listStars() {
        var output = ""
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away. \n"
        }
        
        starsTextView.text = output
    }
    // 18. Add the TextFields to an empty string to clear it
    private func clearInput() {
        self.starNameTextField.text = ""
        self.distanceTextField.text = ""
    }
    
}

