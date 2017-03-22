//
//  PugAPIClient.swift
//  multipugbomb
//
//  Created by TJ Carney on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

class PugAPIClient{
    
    static func getPug(completion: @escaping ([String:String]) -> Void ) {
        let urlString = "http://pugme.herokuapp.com/random"
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    
                    if let unwrappedData = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:String] ?? [:]
                            completion(json)
                        } catch {
                            
                        }
                        
                    }
                }
            })
            
            dataTask.resume()
            
        }
    }
    
    static func downloadImage(at urlString: String, completion: @escaping (UIImage?) -> Void) {
        if let url = URL(string: urlString) {
            let session = URLSession.shared
            let request = URLRequest(url: url)
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                guard let rawData = data, let image = UIImage(data: rawData) else { completion(nil); return }
                completion(image)
            }
            dataTask.resume()
        }
        
    }
}
