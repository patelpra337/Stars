//
//  StarController.swift
//  Stars (iOSPT1)
//
//  Created by patelpra on 5/9/19.
//  Copyright © 2019 Pravin Patel. All rights reserved.
//

import Foundation

class StarController {
    
    init() {
        self.loadFromPersistentStore()
    }
    
    // Source of all truth
    
    private(set) var stars: [Star] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
    
    // /Users/patelpra/Documents
    
    return documentsDirectory.appendingPathComponent("stars.plist")
    // /Users/patelpra/Documents/stars.plist
}
    func addStar(named name: String, withDistance distance: Double) {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistentStore()
    }
    
    
    // Saving
    func saveToPersistentStore() {
        guard let url = self.persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            NSLog("Error savind stars data: \(error)")
        }
    }
    
    // Loading
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

