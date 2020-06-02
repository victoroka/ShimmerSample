//
//  UIViewMasking.swift
//  ShimmerSample
//
//  Created by Victor Oka on 02/06/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Apply given views as masks
    ///
    /// - Parameter views: Views to apply as mask
    /// ## Note: The view calling this function must have all the views in the given array as subviews.
    func setMaskingViews(for views: [UIView]) {
        let mutablePath = CGMutablePath()
        
        views.forEach { (view) in
            guard self.subviews.contains(view) else {
                fatalError("View: \(view) is not a subview of \(self). Therefore, it cannot be a masking view.")
            }
            
            if view.layer.cornerRadius == 40, view.layer.masksToBounds {
                mutablePath.addEllipse(in: view.frame)
            } else {
                mutablePath.addRect(view.frame)
            }
        }
        
        // Create layer
        let maskLayer = CAShapeLayer()
        maskLayer.path = mutablePath
        
        // Apply layer as mask
        self.layer.mask = maskLayer
    }
    
}
