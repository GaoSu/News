//
//  Color+Extension.swift
//  News
//
//  Created by 刘 on 17/2/27.
//  Copyright © 2017年 刘. All rights reserved.
//

import UIKit

extension UIColor{

    class func colorWithRGB(_ r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor{
   
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    

}
