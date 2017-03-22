//
//  Pug.swift
//  multipugbomb
//
//  Created by TJ Carney on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class Pug {
    
    let store = PugDataStore.sharedInstance
    var imageURL: String
    var image: UIImage?
    
    init(dictionary: [String:String]) {
        imageURL = dictionary["pug"] ?? "No Image"
    }
    
    func downloadImage(completion: @escaping () -> Void) {
        PugAPIClient.downloadImage(at: imageURL, completion: { image in
            self.image = image
            if self.image != nil {
                self.store.validPugs.append(self)
            } else {
            }
            completion()
        })
        
        
    }
}

extension Pug: CustomStringConvertible {
    var description: String {
        return "ImageURL: \(imageURL)"
    }
}
