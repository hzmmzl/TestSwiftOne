//
//  MainViewController.swift
//  DSWeibo
//
//  Created by xiaomage on 15/9/7.
//  Copyright © 2015年 小码哥. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupComposeBtn()
    }
    
    
    //tabar控制器
    fileprivate func addChildViewController() {
        let path = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil)
        if let jsonPath = path {
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonPath))
            do{
                let dictArr = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers)
                print((dictArr as AnyObject).count)
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
    
    fileprivate func addChildViewController(_ childControllerName: String,title:String,imageName:String) {
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
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
    
    //按钮
    fileprivate func setupComposeBtn()
    {
        tabBar.addSubview(composeBtn)
        let width: CGFloat = UIScreen.main.bounds.width / CGFloat((viewControllers?.count)!)
        composeBtn.frame = CGRect(x: width*2, y: 0, width: width, height: 49)
    }
    
    fileprivate lazy var composeBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"tabbar_compose_icon_add"), for: UIControlState())
        btn.setImage(UIImage(named:"tabbar_compose_icon_add_highlighted"), for: UIControlState.highlighted)
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button"), for: UIControlState())
        btn.setBackgroundImage(UIImage(named:"tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        btn.addTarget(self, action: #selector(MainViewController.composeBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    
    func composeBtnClick() {
        print(#function)
    }
    
}
