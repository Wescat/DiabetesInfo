//
//  GeneralTipsViewController.swift
//  Diabetes Information
//
//  Created by Wesley Cates on 2/4/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class CountingCarbsViewController: UIPageViewController{
    
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("CountingCarbs1"),
            self.newViewController("CountingCarbs2"),
            self.newViewController("CountingCarbs3"),
            self.newViewController("CountingCarbs4"),
            self.newViewController("CountingCarbs5"),
            self.newViewController("CountingCarbs6"),
            self.newViewController("CountingCarbs7"),
            self.newViewController("CountingCarbsActivity"),
            self.newViewController("CountingCarbsLast")]
    }()
    
    private func newViewController(view: String) -> UIViewController {
        return UIStoryboard(name: "HealthyEating", bundle: nil) .
            instantiateViewControllerWithIdentifier("\(view)")
    }
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                direction: .Forward,
                animated: true,
                completion: nil)
        }
        
    }
}

extension CountingCarbsViewController: UIPageViewControllerDataSource{
    
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            guard previousIndex >= 0 else {
                return nil
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            guard orderedViewControllersCount != nextIndex else {
                return nil
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
    }
}
