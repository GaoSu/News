//
//  MainTabBarController.swift
//  News
//
//  Created by 刘 on 17/2/26.
//  Copyright © 2017年 刘. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置导航栏的颜色
        tabBar.tintColor = NAVIGATIONBAR_RED_COLOR;
     
        //添加所用的子控制器
        addAllChildViewController()
        
        // Do any additional setup after loading the view.
    }

    
    
    /// 添加子控制器
    fileprivate func addAllChildViewController(){
    
        //新闻
        let newsVC = UIStoryboard.init(name: "GSNewsViewController", bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC: newsVC, title: "资讯", imageName: "tabbar_icon_news")
        
        //图秀
        let photoVC = UIStoryboard.init(name: "PhotoViewController", bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC: photoVC, title: "图秀", imageName: "tabbar_icon_media")
        
        //热门
        let hotsVC = UIStoryboard.init(name: "HotsViewController", bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC: hotsVC, title: "热门", imageName: "tabbar_icon_reader")
        
        //我
        let profileVC = UIStoryboard.init(name: "ProfileViewController", bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC: profileVC, title: "我", imageName: "tabbar_icon_me")
        
        
    }
    
    fileprivate func addChildViewController(childVC : UIViewController,title:String,imageName:String){
        
        childVC.title = title
        childVC.tabBarItem.title = title
        childVC.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 12)], for: UIControlState())
        childVC.tabBarItem.image = UIImage(named: "\(imageName)_normal")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        childVC.tabBarItem.selectedImage =  UIImage(named: "\(imageName)_highlight")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        addChildViewController(childVC)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
