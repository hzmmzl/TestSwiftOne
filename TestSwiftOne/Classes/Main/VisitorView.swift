//
//  VisitorView.swift
//  TestSwiftOne
//
//  Created by winbei on 16/6/21.
//  Copyright © 2016年 winbei. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    func setupVisitorInfo(isHome:Bool, imageName:String, message:String){
        incoView.hidden = !isHome
        homeIcon.image = UIImage(named: imageName)
        messageLabel.text = message
        if isHome {
            startAnimation()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 1.添加子控件
        addSubview(incoView)
        addSubview(maskBGView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        // 2.布局子控件
        // 2.1设置背景
        incoView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        // 2.2设置小房子
        homeIcon.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        // 2.3设置文本
        messageLabel.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: incoView, size:nil)
        
        // "哪个控件" 的 "什么属性" "等于" "另外一个控件" 的 "什么属性" 乘以 "多少" 加上 "多少"
        // 如果你想设置的约束里不需要第二个view，要将第四个参数设为nil，第五个参数设为NSLayoutAttributeNotAnAttribute
        let widthCons = NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 224)
        addConstraint(widthCons)
        
        // 2.4设置按钮
        registerButton.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        loginButton.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        // 2.5设置蒙版
        maskBGView.xmg_Fill(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func startAnimation() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2*M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        anim.removedOnCompletion = false
        incoView.layer.addAnimation(anim, forKey: nil)
    }
    
    //MARK:-懒加载
    private lazy var incoView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return img
    }()
    
    private lazy var homeIcon: UIImageView = {
        let img = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return img
    }()
    
    private lazy var messageLabel: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.textColor = UIColor.darkGrayColor()
        lab.text = "fdadfa"
        return lab
    }()
    
    private lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
    private lazy var loginButton: UIButton = {
        let logBtn = UIButton()
        logBtn.setTitle("登录", forState: UIControlState.Normal)
        logBtn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        logBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        logBtn.addTarget(self, action: #selector(VisitorView.loginButtonClicked), forControlEvents: UIControlEvents.TouchUpInside)
        return logBtn
    }()
    
    private lazy var registerButton: UIButton = {
        let regBtn = UIButton()
        regBtn.setTitle("注册", forState: UIControlState.Normal)
        regBtn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        regBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        regBtn.addTarget(self, action: #selector(VisitorView.registerButtonClicked), forControlEvents: UIControlEvents.TouchUpInside)
        return regBtn
    }()
    
    func loginButtonClicked() {
        print(#function)
    }
    
    func registerButtonClicked() {
        print(#function)
    }
    
}
