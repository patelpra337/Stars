//
//  StarController.swift
//  Stars (iOSPT1)
//
//  Created by patelpra on 5/9/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import Foundation

class StarController {
    
    // 14.  We need a initializer to run the func so that it can load from disk
    init() {
        self.loadFromPersistentStore()
    }
    
    // 1. Source of all truth, create the array of Star of which is needed by Encapsulation: protect our data from (external) modification
    
    private(set) var stars: [Star] = []
    
    // 11.  Create a private var to protect only accessible to this code file
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    // /Users/patelpra/Documents
    
    return documentsDirectory.appendingPathComponent("stars.plist")
    // /Users/patelpra/Documents/stars.plist
}
    // 2.  Now create func addStar to add new stars that will include name, distance (named: "Sun", withDistance: 0.0)
    // 3.  Create a let constant --> star
    // 4.  Add the star to the list by appending to the array
    func addStar(named name: String, withDistance distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        // 12.  Now we need to save the data
        saveToPersistentStore()
    }
    
    // Save to disk
    // 10.  We are now creating two methods --> save to disk and load from disk using basic persistance.  Create guard let and use the persistentFileURL.
    func saveToPersistentStore() {
        guard let url = self.persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            NSLog("Error saving stars data: \(error)")
        }
    }
    
    // 13.  Load from disk
    func loadFromPersistentStore() {
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            self.stars = try decoder.decode([Star].self, from: data)
        } catch {
            NSLog("Error loading stars data: \(error)")
        }
    }
}

