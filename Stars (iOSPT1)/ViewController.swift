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
        self.listStars()
        self.clearInput()
        
    }

    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var starsTextView: UITextView!
    
    let starController = StarController()
    
    @IBAction func starsTextView(_ sender: Any) {
        guard let name = starNameTextField.text,
            let distanceString = distanceTextField.text,
            let distance = Double(distanceString) else { return }
        
        self.starController.addStar(named: name, withDistance: distance)
        self.listStars()
    }
    
    private func listStars() {
        var output = ""
        for star in starController.stars {
            output += "\(star.name) is \(star.distance) light years away. \n"
        }
        
        starsTextView.text = output
    }
    
    private func clearInput() {
        self.starNameTextField.text = ""
        self.distanceTextField.text = ""
    }
    
}

