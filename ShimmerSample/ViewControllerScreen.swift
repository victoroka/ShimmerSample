//
//  ViewControllerScreen.swift
//  ShimmerSample
//
//  Created by Victor Oka on 02/06/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class ViewControllerScreen: UIView {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ViewControllerScreen: CodeView {
    
    func buildViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    func setupAdditionalConfigurarion() {
        
    }
    
}
