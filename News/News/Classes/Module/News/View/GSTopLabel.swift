//
//  GSTopLabel.swift
//  News
//
//  Created by 刘 on 17/2/27.
//  Copyright © 2017年 刘. All rights reserved.
//

import UIKit

class GSTopLabel: UILabel {

    var scale :CGFloat = 0.0{
        didSet{
        //通过scale的改变来改变各种参数
            textColor = UIColor(red: 1*scale + 0.95, green: 1*scale + 0.95, blue: 1*scale + 0.95, alpha: 1)
            let minScale : CGFloat = 0.9
            let trueScale  = minScale + (1 - minScale) * scale
            transform = CGAffineTransform(scaleX: trueScale, y: trueScale)
        
        }
    }
    
    //MARK:遍历构造函数
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame:CGRect){
     super.init(frame: frame)
     textAlignment = NSTextAlignment.center
     font = UIFont.systemFont(ofSize: 20.0)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
