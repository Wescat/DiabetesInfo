//
//  SugarLevelPageViewController.swift
//  Diabetes Information
//
//  Created by Shelby Regelman on 3/1/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class SugarLevelPageViewController: UIPageViewController{
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("sugarLevel1"),
            self.newViewController("sugarLevel2"),
            self.newViewController("sugarLevel3"),
            self.newViewController("sugarLevel4"),
            self.newViewController("sugarLevel5"),
            self.newViewController("sugarLevel6"),
            self.newViewController("sugarLevelFinal")]
    }()
    
    
    private func newViewController(view: String) -> UIViewController {
        return UIStoryboard(name: "BloodSugar", bundle: nil) .
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

extension SugarLevelPageViewController: UIPageViewControllerDataSource{
    
    
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
