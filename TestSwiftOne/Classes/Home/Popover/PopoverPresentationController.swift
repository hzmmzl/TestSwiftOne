//
//  PopoverPresentationController.swift
//  TestSwiftOne
//
//  Created by winbei on 16/6/22.
//  Copyright © 2016年 winbei. All rights reserved.
//

import UIKit
let kScreenWidth = UIScreen.mainScreen().bounds.width
let kScreenHeight = UIScreen.mainScreen().bounds.height
class PopoverPresentationController: UIPresentationController {
    var presentFrame = CGRectZero
    
    override init(presentedViewController: UIViewController, presentingViewController: UIViewController) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    override func containerViewWillLayoutSubviews() {
//        presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 300)
        if presentFrame == CGRectZero{
            presentedView()?.frame = CGRect(x: 100, y: 56, width: 200, height: 200)
        }else
        {
            presentedView()?.frame = presentFrame
        }
        containerView?.addSubview(coverView)
        containerView?.sendSubviewToBack(coverView)
    }
    
    private lazy var coverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.mainScreen().bounds
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(PopoverPresentationController.close))
        view.addGestureRecognizer(tap)
        return view
    }()
    func close() {
        presentedViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
