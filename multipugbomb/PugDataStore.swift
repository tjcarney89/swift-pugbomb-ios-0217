//
//  PugDataStore.swift
//  multipugbomb
//
//  Created by TJ Carney on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

final class PugDataStore {
    static let sharedInstance = PugDataStore()
    private init () {}
    
    var pugs: [Pug] = []
    
    func createPug(completion: @escaping (Pug?) -> Void) {
        PugAPIClient.getPug { (pugDict) in
            let newPug = Pug(dictionary: pugDict)
            self.pugs.append(newPug)
            completion(newPug)
        }
        
    }
    
}
