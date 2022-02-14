//
//  xbNavBarView.swift
//  FSCycleSwift
//
//  Created by huadong on 2022/2/11.
//

import UIKit
import SnapKit

class xbNavBarView: UIImageView {

    typealias xbNavBarViewItemActionBlock = ((UIButton, Int) -> Void)
    fileprivate var backActionBlcok: xbNavBarViewItemActionBlock?
   
    /** 安全区域 - 顶部高度*/
    private func getSafeAreaInsetsTopHeight() -> CGFloat {
        // 经打印发现安全区域顶部高度跟状态栏高度一样
        var topH: CGFloat = UIApplication.shared.statusBarFrame.size.height
        ///var topH: CGFloat = 0.0
        
        if topH > 20.0 {
            topH = 44.0
            if #available(iOS 11.0, *) {
                if let window = UIApplication.shared.keyWindow {
                    topH = window.safeAreaInsets.top
                }
            }
        }
        
        return topH
    }
    
    @objc private func navBarViewButtonAction(sender: UIButton){
        if let block = self.backActionBlcok {
            let tag  = sender.tag - 90000
            block(sender, tag)
        }
    }
   
    public convenience init(bgImage: String?, title: String?, backBtn: UIButton?, rightItems: [UIButton], rightSpace: CGFloat, itemAction: xbNavBarViewItemActionBlock?) {
        self.init()
        
        let navBarH: CGFloat = getSafeAreaInsetsTopHeight() + 44.0
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: navBarH)
        self.frame = frame
        
        self.backActionBlcok = itemAction
        
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
        if let bgImg = bgImage {
            self.image = UIImage(named: bgImg)
        }
        
        if let backButton = backBtn {
            backButton.addTarget(self, action: #selector(navBarViewButtonAction(sender:)), for: .touchUpInside)
            backButton.tag = 90000
            self.addSubview(backButton)
            
            backBtn?.snp_makeConstraints({ make  in
                make.left.bottom.equalToSuperview()
                make.size.equalTo(backButton.bounds.size)
            })
        }
        
        self.titleLabel.text = title
        self.addSubview(self.titleLabel)
        
        self.titleLabel.snp_makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(44.0)
        }
        
        // 添加右边items
        var totalW: CGFloat = 0.0
        
        for i in 0..<rightItems.count {
            let button: UIButton = rightItems[i]
            button.addTarget(self, action: #selector(navBarViewButtonAction(sender:)), for: .touchUpInside)
            button.tag = 90001 + i
            
            totalW += button.bounds.size.width
        }
        
        var left: CGFloat = 0.0
        
        for i in 0..<rightItems.count {
            let button: UIButton = rightItems[i]
            self.addSubview(button)
            
            let origin_x = (self.bounds.size.width - totalW - rightSpace) + left
            left += button.bounds.size.width
            
            button.snp_makeConstraints { make in
                make.left.equalToSuperview().offset(origin_x)
                make.bottom.equalToSuperview()
                make.size.equalTo(CGSize(width: button.bounds.size.width, height: 44.0))
            }
        }
        
    }

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
        
        return label
    }()

}
