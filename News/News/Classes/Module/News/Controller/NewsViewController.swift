//
//  NewsViewController.swift
//  News
//
//  Created by 刘 on 17/2/26.
//  Copyright © 2017年 刘. All rights reserved.
//

import UIKit
import SnapKit

class NewsViewController: UIViewController {

    @IBOutlet weak var topView: UIScrollView!//顶部的滚动条
    
    @IBOutlet weak var contentView: UIScrollView!//内容视图
    
    var contentOffsetX : CGFloat = 0.0
    
    
    fileprivate var selectedArr : [[String : String]]?
    fileprivate var optionalArr : [[String : String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

      prepareUI()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
    }
    //销毁的方法
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
   /// 准备视图
   fileprivate func prepareUI(){
    for subView in topView.subviews {
        if subView .isKind(of: GSTopLabel.classForCoder()) {
            subView.removeFromSuperview()
        }
    }
    
    for subView in contentView.subviews {
        subView.removeFromSuperview()
    }
    for vc in childViewControllers {
        vc.removeFromParentViewController()
    }

      //添加内容
    addContent()
    }
    
//MARK:添加顶部的标题栏和控制器
    fileprivate func addContent(){
      //初始化栏目
        setupColumn()
      // 布局用的左边距
        var leftMargin: CGFloat = 0.0
        
        for i  in 0..<selectedArr!.count {
            let label = GSTopLabel()
            label.text = selectedArr?[i]["classname"]
            label.tag = i
            label.scale = i == 0 ? 1.0 : 0.0
            label.isUserInteractionEnabled = true
            topView.addSubview(label)
            
            //利用layout来适应各种的长度的label
            label.snp.makeConstraints({ (make) in
                make.left.equalTo(leftMargin + 15)
                make.centerY.equalTo(topView)
                
            })
            topView.layoutIfNeeded()
            leftMargin = label.frame.maxX
            //添加标签的点击手势
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didClickTopLabel(_gesture:))))
            //添加控制器
            let newsVC = GSNewsTableViewController()
            addChildViewController(newsVC)
            // 设置默认控制器
            if i <= 1 {
               addContentViewController(index: i)
            }
            
        }
        
    
        //内容区域的滚动范围
        contentView.contentSize = CGSize(width: CGFloat (childViewControllers.count) * SCREEN_WIDTH, height: 0)
        contentView.isPagingEnabled = true
        
        let lastLabel = topView.subviews.last as! GSTopLabel
        //设置顶部的标签的滚动范围
        topView.contentSize = CGSize(width: leftMargin + lastLabel.frame.width, height: 0)
        
        //视图滚动到第一个位置
        contentView.setContentOffset(CGPoint(x:0 ,y:contentView.contentOffset.y), animated: true)

        
        
        
    }
    
    fileprivate func addContentViewController(index:Int){
    
        let newsVC = childViewControllers[index] as! GSNewsTableViewController
        //如果已经展示过了就直接返回
        if newsVC.view.superview != nil {
            return
        }
        newsVC.view.frame = CGRect(x: CGFloat(index) * SCREEN_WIDTH,y:0,width:contentView.bounds.size.width, height:contentView.bounds.size.height)
        contentView.addSubview(newsVC.view)
//        newsVC.claa
        
    
    }
    
    /// 配置栏目栏
    fileprivate func setupColumn(){
    
        let tempSelectedArr = UserDefaults.standard.object(forKey: "selectedArray") as? [[String :String]]
        let tempOptionalArr = UserDefaults.standard.object(forKey: "optionalArray")  as? [[String :String]]
        
        if tempSelectedArr != nil || tempOptionalArr != nil {
            selectedArr = tempSelectedArr != nil ? tempSelectedArr : [[String :String]]()
            optionalArr = tempOptionalArr != nil ? tempOptionalArr : [[String : String]]()
        }else{
        //如果全部为空,就初始化
            selectedArr = [
                [
                    "classid" : "0",
                    "classname" : "今日头条"
                ],
                [
                    "classid" : "2",
                    "classname": "网文快讯"
                ],
                [
                    "classid" : "21",
                    "classname": "媒体视角"
                ],
                [
                    "classid" : "12",
                    "classname": "网文IP"
                ],
                [
                    "classid" : "264",
                    "classname": "企业资讯"
                ],
                [
                    "classid" : "33",
                    "classname": "作家风采"
                ],
                [
                    "classid" : "34",
                    "classname": "维权在线"
                ],
                [
                    "classid" : "212",
                    "classname": "业者动态"
                ],
                [
                    "classid" : "132",
                    "classname": "风花雪月"
                ],
                [
                    "classid" : "396",
                    "classname": "独家报道"
                ],
                [
                    "classid" : "119",
                    "classname": "求职招聘"
                ],
            ]
            optionalArr = [
                [
                    "classid" : "32",
                    "classname": "高端访谈"
                ],
                [
                    "classid" : "102",
                    "classname": "政策解读"
                ],
                [
                    "classid" : "111",
                    "classname": "写作指导"
                ],
                [
                    "classid" : "115",
                    "classname": "征稿信息"
                ],
                [
                    "classid" : "51",
                    "classname": "精彩活动"
                ],
                [
                    "classid" : "440",
                    "classname": "写作常识"
                ],
                [
                    "classid" : "209",
                    "classname": "数据分析"
                ],
                [
                    "classid" : "208",
                    "classname": "统计图表"
                ],
                [
                    "classid" : "405",
                    "classname": "名家专栏"
                ],
                [
                    "classid" : "394",
                    "classname": "传统文学"
                ],
                [
                    "classid" : "414",
                    "classname": "写作素材"
                ],
                [
                    "classid" : "281",
                    "classname": "游戏世界"
                ],
                [
                    "classid" : "57",
                    "classname": "娱乐八卦"
                ],
                [
                    "classid" : "58",
                    "classname": "社会杂谈"
                ],
                [
                    "classid" : "56",
                    "classname": "影视动画"
                ]
            ]
            
        // 然后保存起来
            UserDefaults.standard.set(selectedArr, forKey: "selectedArray")
            UserDefaults.standard.set(optionalArr, forKey: "optionalArray")
            
        }
        
    }
  
    //MARK:点击顶部标签的方法
    @objc fileprivate func didClickTopLabel(_gesture:UITapGestureRecognizer){
       
        let titleLabel = _gesture.view as! GSTopLabel
        contentView.setContentOffset(CGPoint(x: CGFloat(titleLabel.tag ) * contentView.frame.size.width,y:contentView.contentOffset.y), animated: true)
    
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


//MARK:-scrollView代理方法

extension NewsViewController : UIScrollViewDelegate{
    
    //滑动结束触发
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let  index = Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
        let titleLabel = topView.subviews[index]
        var offsetX = titleLabel.center.x - topView.frame.size.width * 0.5
        let offsetMax = topView.contentSize.width - topView.frame.size.width
        
        if offsetX < 0 {
            offsetX = 0
        } else if (offsetX > offsetMax){
        offsetX = offsetMax
        }
        
        //滚动顶部的标题
        topView.setContentOffset(CGPoint(x: offsetX,y:topView.contentOffset.y), animated: true)
        // 恢复其他label的缩放
        for i in 0..<selectedArr!.count {
            if i != index {
                let topLabel = topView.subviews[i] as! GSTopLabel
                topLabel.scale = 0.0
            }
        }
        
        //添加控制器 - 并预加载控制器 左划 加载下一个，右滑加载上一个
        let value = (scrollView.contentOffset.x / scrollView.frame.width)
        
        var index1 = Int(value)
        var index2 = Int(value)
        
        if scrollView.contentOffset.x - contentOffsetX > 2.0 {
            index1 = (value - CGFloat(Int(value))) > 0 ? Int(value) + 1 : Int(value)
            index2 = index1 + 1
        } else if contentOffsetX - scrollView.contentOffset.x > 2{
            index1 = (value - CGFloat(Int(value))) < 0 ?  Int(value) - 1 : Int(value)
            index2 = index1 - 1
        }
        
        if index1 > childViewControllers.count - 1  {
            index1 = childViewControllers.count - 1
        }else if index1 < 0{
            index1 = 0
        }
        
        if  index2 > childViewControllers.count - 1 {
            index2 = childViewControllers.count - 1
        }else if index2 < 0 {
            index2 = 0
        }
        
        //这样预加载，增加用户体验
        addContentViewController(index: index1)
        addContentViewController(index: index2)
        
    }
    //
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
    }
    //开始拖拽视图
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        contentOffsetX = scrollView.contentOffset.x
    }
    //正在滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = (scrollView.contentOffset.x / scrollView.frame.width)
        
        let leftIndex = Int(value)
        let rightIndex = leftIndex + 1
        let scaleRight = value - CGFloat(leftIndex)
        let scaleLeft = 1 - scaleRight
        
        let labelLeft = topView.subviews[leftIndex] as! GSTopLabel
        labelLeft.scale = scaleLeft
        
        if rightIndex < topView.subviews.count {
            let labelRight = topView.subviews[rightIndex] as! GSTopLabel
            labelRight.scale = scaleRight
            
        }
       
    }
    
}

