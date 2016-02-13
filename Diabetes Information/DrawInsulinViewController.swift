//
//  GeneralTipsViewController.swift
//  Diabetes Information
//
//  Created by Ennis Smith on 2/4/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class DrawInsulinViewController: UIPageViewController{
    
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("drawInsulin1"),
            self.newViewController("drawInsulin2"),
            self.newViewController("drawInsulin3"),
            self.newViewController("drawInsulin4"),
            self.newViewController("drawInsulin5"),
            self.newViewController("drawInsulin6"),
            self.newViewController("drawInsulin7")]
    }()
    
    private func newViewController(view: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
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

extension DrawInsulinViewController: UIPageViewControllerDataSource{
    
    
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
