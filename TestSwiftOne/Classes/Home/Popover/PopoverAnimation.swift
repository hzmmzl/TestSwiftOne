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
    var presentFrame = CGRectZero
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        let popo = PopoverPresentationController(presentedViewController: presented, presentingViewController: presenting)
        popo.presentFrame = presentFrame
        return popo
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        NSNotificationCenter.defaultCenter().postNotificationName(popoverWillShow, object: nil)
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        NSNotificationCenter.defaultCenter().postNotificationName(popoverWillDismiss, object: nil)
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        if isPresent{
            let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
            toView?.transform = CGAffineTransformMakeScale(1, 0);
            transitionContext.containerView()?.addSubview(toView!)
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            UIView.animateWithDuration(0.5, animations: {
                toView?.transform = CGAffineTransformIdentity
                
            })
            transitionContext.completeTransition(true)
        }else{
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)
            UIView.animateWithDuration(0.2, animations: {
                fromView?.transform = CGAffineTransformMakeScale(1.0, 0.00000001)
                },completion:{(_) ->Void in
                    transitionContext.completeTransition(true)
            })
        }
    }
}
