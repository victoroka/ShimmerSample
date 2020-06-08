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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.refreshScreenComponents), name: UIApplication.willEnterForegroundNotification, object: UIApplication.shared)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    @objc func refreshScreenComponents() {
        screen.setupMaskingViews()
    }
}
