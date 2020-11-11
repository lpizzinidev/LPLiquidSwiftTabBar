//
//  ViewController.swift
//  Example
//
//  Created by Luca Pizzini on 06/11/2020
//  Copyright © 2020 Luca Pizzini. All rights reserved.
//

import UIKit
import LPLiquidSwiftTabBar

class ViewController: UIViewController {
    
    @IBOutlet weak var liquidTabBar: LPLiquidSwiftTabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLiquidTabBar()
    }
    
    private func setupLiquidTabBar()
    {
        liquidTabBar.tabBarItemFont = UIFont.boldSystemFont(ofSize: 17)
        liquidTabBar.tabBarAnimationDuration = 0.4
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .red
        
        let firstLiquidTabItem = LPLiquidSwiftTabBarItem(title: "First", image:  UIImage(systemName: "bell")!)
        liquidTabBar.add(newLiquidTabBarItem: firstLiquidTabItem, withViewController: firstVC)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .green
        
        let secondLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Second", image:  UIImage(systemName: "pencil")!)
        liquidTabBar.add(newLiquidTabBarItem: secondLiquidTabItem, withViewController: secondVC)
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .blue
        
        let thirdLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Third", image:  UIImage(systemName: "trash")!)
        liquidTabBar.add(newLiquidTabBarItem: thirdLiquidTabItem, withViewController: thirdVC)
    }
}

