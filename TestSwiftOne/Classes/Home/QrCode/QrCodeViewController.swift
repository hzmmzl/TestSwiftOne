//
//  QrCodeViewController.swift
//  TestSwiftOne
//
//  Created by winbei on 16/6/23.
//  Copyright © 2016年 winbei. All rights reserved.
//

import UIKit

class QrCodeViewController: UIViewController,UITabBarDelegate {
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    @IBOutlet weak var tiaoXinMaImage: UIImageView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tabbar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbar.delegate = self
        tabbar.selectedItem = tabbar.items![0]
    }
    
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectPhotoButtonClicked() {
        
    }
    fileprivate func startAnimation(){
        bottomConstraint.constant = 0
        tiaoXinMaImage.layoutSubviews()
        UIView.animate(withDuration: 2, animations: {
            self.bottomConstraint.constant = -self.containerHeightCons.constant
            self.tiaoXinMaImage.layoutSubviews()
        }) 
    }
    
    //MARK: -UITabBarDelegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            containerHeightCons.constant = 300
        }else if item.tag == 2{
            containerHeightCons.constant = 150
        }
        tiaoXinMaImage.layer.removeAllAnimations()
        startAnimation()
    }
}
