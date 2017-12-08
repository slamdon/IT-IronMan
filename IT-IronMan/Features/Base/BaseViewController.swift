//
//  BaseViewController.swift
//  IT-IronMan
//
//  Created by don chen on 2017/12/8.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var activityVC:BaseLoadingViewController?
    var isBackgroundImageHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityVC = BaseLoadingViewController(nibName: "BaseLoadingViewController", bundle: nil)
        activityVC?.modalTransitionStyle = . crossDissolve
        activityVC?.modalPresentationStyle = .overFullScreen
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func addHideKeyboardWhenTapbackground() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc fileprivate func hideKeyboard() {
        view.endEditing(true)
    }
    
    func showLoadingView(completion:(() -> Swift.Void)? = nil) {
        if activityVC != nil {
            present(activityVC!, animated: true, completion: {
                completion?()
            })
        }
        
    }
    
    func dismissLoadingView(completion:(() -> Swift.Void)? = nil) {
        activityVC?.dismiss(animated: true, completion: {
            completion?()
        })
    }
    
    
    
}

