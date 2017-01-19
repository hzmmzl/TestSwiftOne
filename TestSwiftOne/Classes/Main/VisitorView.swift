//
//  VisitorView.swift
//  TestSwiftOne
//
//  Created by winbei on 16/6/21.
//  Copyright © 2016年 winbei. All rights reserved.
//

import UIKit

class VisitorView: UIView {

    func setupVisitorInfo(_ isHome:Bool, imageName:String, message:String){
        incoView.isHidden = !isHome
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
        incoView.xmg_AlignInner(type: XMG_AlignType.center, referView: self, size: nil)
        // 2.2设置小房子
        homeIcon.xmg_AlignInner(type: XMG_AlignType.center, referView: self, size: nil)
        // 2.3设置文本
        messageLabel.xmg_AlignVertical(type: XMG_AlignType.bottomCenter, referView: incoView, size:nil)
        
        // "哪个控件" 的 "什么属性" "等于" "另外一个控件" 的 "什么属性" 乘以 "多少" 加上 "多少"
        // 如果你想设置的约束里不需要第二个view，要将第四个参数设为nil，第五个参数设为NSLayoutAttributeNotAnAttribute
        let widthCons = NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 224)
        addConstraint(widthCons)
        
        // 2.4设置按钮
        registerButton.xmg_AlignVertical(type: XMG_AlignType.bottomLeft, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        loginButton.xmg_AlignVertical(type: XMG_AlignType.bottomRight, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        // 2.5设置蒙版
        maskBGView.xmg_Fill(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func startAnimation() {
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 2*M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        anim.isRemovedOnCompletion = false
        incoView.layer.add(anim, forKey: nil)
    }
    
    //MARK:-懒加载
    fileprivate lazy var incoView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return img
    }()
    
    fileprivate lazy var homeIcon: UIImageView = {
        let img = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return img
    }()
    
    fileprivate lazy var messageLabel: UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 0
        lab.textColor = UIColor.darkGray
        lab.text = "fdadfa"
        return lab
    }()
    
    fileprivate lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()
    
    fileprivate lazy var loginButton: UIButton = {
        let logBtn = UIButton()
        logBtn.setTitle("登录", for: UIControlState())
        logBtn.setTitleColor(UIColor.darkGray, for: UIControlState())
        logBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState())
        logBtn.addTarget(self, action: #selector(VisitorView.loginButtonClicked), for: UIControlEvents.touchUpInside)
        return logBtn
    }()
    
    fileprivate lazy var registerButton: UIButton = {
        let regBtn = UIButton()
        regBtn.setTitle("注册", for: UIControlState())
        regBtn.setTitleColor(UIColor.darkGray, for: UIControlState())
        regBtn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState())
        regBtn.addTarget(self, action: #selector(VisitorView.registerButtonClicked), for: UIControlEvents.touchUpInside)
        return regBtn
    }()
    
    func loginButtonClicked() {
        print(#function)
    }
    
    func registerButtonClicked() {
        print(#function)
    }
    
}
