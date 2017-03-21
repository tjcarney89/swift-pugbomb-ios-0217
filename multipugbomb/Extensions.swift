//
//  Extensions.swift
//  multipugbomb
//
//  Created by Johann Kerr on 3/21/17.
//  Copyright © 2017 Johann Kerr. All rights reserved.
//

import Foundation
import UIKit

let filtersToApply = ["CIBloom",
                      "CIPhotoEffectProcess",
                      "CIExposureAdjust"]

extension UIImage {
    
    
    func filter(with filter: String) -> UIImage? {
        
        UIGraphicsBeginImageContext(self.size)
        
        let image = CIImage(image: self)
        
        guard let cgContext = UIGraphicsGetCurrentContext() else { return self }
        let ciContext = CIContext(cgContext: cgContext, options: nil)
        
        guard let ciFilter = CIFilter(name: filter) else { print("Invalid filter"); return self }
        ciFilter.setValue(image, forKey: kCIInputImageKey)
        
        guard let ciImage = ciFilter.outputImage else { print("Failed to get filter output"); return self }
        guard let cgImage = ciContext.createCGImage(ciImage, from: ciImage.extent) else { return nil }
        
        let result = UIImage(cgImage: cgImage)
        result.draw(at: CGPoint.zero)
        
        guard let finalResult = UIGraphicsGetImageFromCurrentImageContext() else { print("Could not save final UIImage"); return nil }
        
        UIGraphicsEndImageContext()
        
        print("\(filter) applied to image")
        
        return finalResult
        
    }
    
}
