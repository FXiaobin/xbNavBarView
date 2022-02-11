//
//  ViewController.swift
//  xbNavBarViewDemo
//
//  Created by huadong on 2022/2/11.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        customNavigationBar()
    }

   
    // 自定义导航条
    func customNavigationBar() {
        
        let backBtn  = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        backBtn.setImage(UIImage(named: "navBack_black"), for: .normal)
                        
        let titleBtn  = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        titleBtn.setTitle("提交", for: .normal)
        titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15.0, weight: .regular)
        
        let imgBtn  = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        imgBtn.setImage(UIImage(named: "close_black"), for: .normal)        
        
        let nav = xbNavBarView(bgImage: "NavigationBGBar", title: "我的", backBtn: backBtn, rightItems: [titleBtn, imgBtn], rightSpace: 10 ) { (sender, tag) in
            
            debugPrint("--- tag = \(tag)")
            
            if tag ==  0 {
                // 返回
                
            }else {
                
                
            }
        }
        
        self.view.addSubview(nav)
    }
}

