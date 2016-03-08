//
//  ExerciseAndBloodViewController.swift
//  Diabetes Information
//
//  Created by Ennis Smith on 2/22/16.
//  Copyright © 2016 Comp 4710 Group 5. All rights reserved.
//

import UIKit

class ExerciseAndBloodViewController: UIPageViewController{
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController("ExerciseandBlood1"),
            self.newViewController("ExerciseandBlood2"),
            self.newViewController("ExerciseandBlood3"),
            self.newViewController("ExerciseandBlood4"),
            self.newViewController("ExerciseandBlood5"),
            self.newViewController("ExerciseandBlood6"),
            self.newViewController("ExerciseandBlood7"),
            self.newViewController("ExerciseandBloodFinal")]
    }()
    
    
    private func newViewController(view: String) -> UIViewController {
        return UIStoryboard(name: "Exercise", bundle: nil) .
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

extension ExerciseAndBloodViewController: UIPageViewControllerDataSource{
    
    
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