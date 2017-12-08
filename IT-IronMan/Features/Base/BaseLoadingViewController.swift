//
//  BaseLoadingViewController.swift
//  CoolFunGo
//
//  Created by Don on 2016/12/18.
//  Copyright © 2016年 Don. All rights reserved.
//

import UIKit

class BaseLoadingViewController: UIViewController {

    @IBOutlet var activityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        activityView.startAnimating()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        activityView.stopAnimating()
    }
    
    

}
