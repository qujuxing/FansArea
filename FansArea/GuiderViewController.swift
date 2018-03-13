//
//  GuiderViewController.swift
//  FansArea
//
//  Created by 瞿炬星 on 2018/3/13.
//  Copyright © 2018年 瞿炬星. All rights reserved.
//

import UIKit

class GuiderViewController: UIPageViewController,UIPageViewControllerDataSource {
  
    var headings = ["Swift 3","iOS 10", "零基础"]
    var images = ["swift", "iOS", "beginner"]
    var footers = ["Swift 3语法适配，超人一步","iOS 10版本新特性，马上学习","无需预备知识，新手也能轻松入门"]

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        if let startVC = vc(atIndex: 0) {
            setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK:  - DataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        
        index  -= 1
        return vc(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        
        index  += 1
        return vc(atIndex: index)
    }
    
    func vc(atIndex: Int) -> ContentViewController? {
        if case 0..<headings.count = atIndex {
            if let contentVC = storyboard?.instantiateViewController(withIdentifier: "ContentController") as? ContentViewController {
                contentVC.heading = headings[atIndex]
                contentVC.footer = footers[atIndex]
                contentVC.imageName = images[atIndex]
                contentVC.index = atIndex
                
                return contentVC
            }
        }
        return nil
    }
    
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return headings.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
