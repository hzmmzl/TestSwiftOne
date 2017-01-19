//
//  PopoverAnimation.swift
//  TestSwiftOne
//
//  Created by winbei on 16/6/23.
//  Copyright © 2016年 winbei. All rights reserved.
//

import UIKit

class PopoverAnimation: NSObject,UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    /// 记录当前是否是展开
    var isPresent: Bool = false
    var presentFrame = CGRect.zero
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let popo = PopoverPresentationController(presentedViewController: presented, presenting: presenting)
        popo.presentFrame = presentFrame
        return popo
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        NotificationCenter.default.post(name: Notification.Name(rawValue: popoverWillShow), object: nil)
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        NotificationCenter.default.post(name: Notification.Name(rawValue: popoverWillDismiss), object: nil)
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent{
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            toView?.transform = CGAffineTransform(scaleX: 1, y: 0);
            transitionContext.containerView.addSubview(toView!)
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            UIView.animate(withDuration: 0.5, animations: {
                toView?.transform = CGAffineTransform.identity
                
            })
            transitionContext.completeTransition(true)
        }else{
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            UIView.animate(withDuration: 0.2, animations: {
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.00000001)
                },completion:{(_) ->Void in
                    transitionContext.completeTransition(true)
            })
        }
    }
}
