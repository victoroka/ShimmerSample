//
//  ViewController.swift
//  ShimmerSample
//
//  Created by Victor Oka on 02/06/20.
//  Copyright © 2020 Victor Oka. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    let screen = ViewControllerScreen()
    
    override func loadView() {
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
