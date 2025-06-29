//
//  HapticManager.swift
//
//  Created by Apple on 04/07/2023.
//

import Foundation
import UIKit


final class HapticManager {
 static   let shared = HapticManager()
    
    
    private init() {}
    
    public func vibrateForSelection() {
        DispatchQueue.main.async {
            let generator = UISelectionFeedbackGenerator()
            generator.prepare()
            generator.selectionChanged()
        }
    }
  
    
    
}
