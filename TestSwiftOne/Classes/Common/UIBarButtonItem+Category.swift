//
//  UIBarButtonItem+Category.swift
//  DSWeibo
//
//  Created by xiaomage on 15/9/7.
//  Copyright © 2015年 小码哥. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    // 如果在func前面加上class, 就相当于OC中的+
    class func creatBarButtonItem(_ imageName:String, target: AnyObject?, action:Selector) ->UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        btn.sizeToFit()
        return UIBarButtonItem(customView: btn)
    }
}
