//
//  MainViewController.swift
//  DSWeibo
//
//  Created by xiaomage on 15/9/7.
//  Copyright © 2015年 小码哥. All rights reserved.
//

import UIKit
/*
command + j -> 定位到目录结构
⬆️⬇️键选择文件夹
按回车 -> command + c 拷贝文件名称
command + n 创建文件
*/
class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.orangeColor()
        
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            do{
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
                print(dictArr.count)
                for dic in dictArr as! [[NSString : String]] {
                    addChildViewController(dic["vcName"]!, title: dic["title"]!, imageName: dic["imageName"]!)
                }
            }catch{
                print(error)
                addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
                addChildViewController("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
                addChildViewController("DiscoverTableViewController", title: "广场", imageName: "tabbar_discover")
                addChildViewController("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
            }
        }
    }
    
    private func addChildViewController(childControllerName: String,title:String,imageName:String) {
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        vc.title = title
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        addChildViewController(nav)
    }
}
