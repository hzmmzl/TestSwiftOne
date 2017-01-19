//
//  PopoverPresentationController.swift
//  TestSwiftOne
//
//  Created by winbei on 16/6/22.
//  Copyright © 2016年 winbei. All rights reserved.
//

import UIKit
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
class PopoverPresentationController: UIPresentationController {
    var presentFrame = CGRect.zero
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews() {
//        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 300)
        if presentFrame == CGRect.zero{
            presentedView?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        }else
        {
            presentedView?.frame = presentFrame
        }
        containerView?.addSubview(coverView)
        containerView?.sendSubview(toBack: coverView)
    }
    
    fileprivate lazy var coverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopoverPresentationController.close))
        view.addGestureRecognizer(tap)
        return view
    }()
    func close() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}
