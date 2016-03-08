//
//  GeneralTipsViewController.swift
//  Diabetes Information
//
//  Created by Wesley Cates on 2/15/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class InsulinBasicsViewController: UIPageViewController{
    
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("InsulinBasics1"),
            self.newViewController("InsulinBasics2"),
            self.newViewController("InsulinBasics3"),
            self.newViewController("InsulinBasics4"),
            self.newViewController("InsulinBasics5"),
            self.newViewController("InsulinBasics6"),
            self.newViewController("InsulinBasics7"),
            self.newViewController("InsulinBasics8"),
            self.newViewController("InsulinBasicsFinal")]
    }()
    
    private func newViewController(view: String) -> UIViewController {
        return UIStoryboard(name: "Insulin", bundle: nil) .
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

extension InsulinBasicsViewController: UIPageViewControllerDataSource{
    
    
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
