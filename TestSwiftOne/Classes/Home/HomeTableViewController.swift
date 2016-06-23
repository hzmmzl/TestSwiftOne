//
//  HomeTableViewController.swift
//  DSWeibo
//
//  Created by xiaomage on 15/9/7.
//  Copyright © 2015年 小码哥. All rights reserved.
//

import UIKit
let popoverWillShow = "popoverWillShow"
let popoverWillDismiss = "popoverWillDismiss"
class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if !userLogin {
            visitorView!.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeTableViewController.popoverDidShowOrDismiss), name: popoverWillShow, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeTableViewController.popoverDidShowOrDismiss), name: popoverWillDismiss, object: nil)
        setupNav()
    }
    func popoverDidShowOrDismiss(){
        let titleButton = navigationItem.titleView as! TitleButton
        titleButton.selected = !titleButton.selected
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    private func setupNav()
    {
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem("navigationbar_friendattention", target: self, action: #selector(HomeTableViewController.leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem("navigationbar_pop", target: self, action: #selector(HomeTableViewController.rightItemClick))
        
        //titleView
        let titleView: TitleButton = TitleButton()
        titleView.setTitle("我的我的", forState: UIControlState.Normal)
        titleView.addTarget(self, action: #selector(HomeTableViewController.titleButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.titleView = titleView
    }
    
    func titleButtonClicked(btn: TitleButton) {
//        btn.selected = !btn.selected
        let vc = PopoverViewController()
        vc.transitioningDelegate = popoverAnimation;
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func leftItemClick() {
        
    }
    func rightItemClick() {
        
    }
    
    private lazy var popoverAnimation: PopoverAnimation = {
        let pop = PopoverAnimation()
        return pop
    }()
    
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

   
}

