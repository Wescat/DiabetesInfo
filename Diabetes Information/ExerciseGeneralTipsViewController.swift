//
//  ExerciseGeneralTipsViewController.swift
//  Diabetes Information
//
//  Created by Ennis Smith on 2/15/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class ExerciseGeneralTipsViewController: UIPageViewController{

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("ExerciseGeneral1"),
            self.newViewController("ExerciseGeneral2"),
            self.newViewController("ExerciseGeneral3"),
            self.newViewController("ExerciseGeneral4"),
            self.newViewController("ExerciseGeneral5"),
            self.newViewController("ExerciseGeneral6"),
            self.newViewController("ExerciseGeneralActivity"),
            self.newViewController("ExerciseGeneralFinal")]
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

extension ExerciseGeneralTipsViewController: UIPageViewControllerDataSource{
    
    
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
