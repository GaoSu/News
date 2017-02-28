//
//  GSNavigationController.swift
//  News
//
//  Created by 刘 on 17/2/27.
//  Copyright © 2017年 刘. All rights reserved.
//

import UIKit

class GSNavigationController: UINavigationController,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navBar = navigationBar
        navBar.barTintColor = NAVIGATIONBAR_WHITE_COLOR
        navBar.isTranslucent = false
        navBar.barStyle = UIBarStyle.black
        
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        navBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor(red:0.173,  green:0.173,  blue:0.173, alpha:1),NSFontAttributeName: UIFont.systemFont(ofSize: 18)]
        // 全屏的返回手势
        panGestureBack()
        
        // Do any additional setup after loading the view.
    }
    
    func panGestureBack() {
        let target = interactivePopGestureRecognizer?.delegate
        
        let pan = UIPanGestureRecognizer.init(target: target
            , action:Selector(("handleNavigationTransition:")))
        pan.delegate = self
        view.addGestureRecognizer(pan)
        interactivePopGestureRecognizer?.isEnabled = false
        
        
    }
    
    //MARK: UIGestureRecognizerDelegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if childViewControllers.count == 1 {
            return false
        }else{
            return true
        }
    }
    
    
    /// 拦截push的操作
    ///
    /// - Parameters:
    ///   - viewController: 即将压栈的控制器
    ///   - animated: 是否有动画
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }else{
            viewController.hidesBottomBarWhenPushed = false
        }
        
        super.pushViewController(viewController, animated: true)
        
        //创建返回的按钮
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"top_navigation_back")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal), style: UIBarButtonItemStyle.done, target: self, action: #selector(back))
        
    }
    
    @objc fileprivate func back (){
  
        popViewController(animated: true)
    
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
