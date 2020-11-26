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
    
    private let primaryColor = UIColor(red: 61.0 / 255.0, green: 90.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
    private let timeout = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLiquidTabBar()
    }
    
    private func setupLiquidTabBar()
    {
        liquidTabBar.tabBarItemTintColor = primaryColor
        liquidTabBar.tabBarSelectedItemTintColor = primaryColor
        
        liquidTabBar.tabBarItemFont = UIFont.boldSystemFont(ofSize: 17)
        liquidTabBar.tabBarAnimationDuration = 0.4
        
        let homeLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Home", image:  UIImage(named: "house")!)
        liquidTabBar.add(newLiquidTabBarItem: homeLiquidTabItem, withViewController: UIViewController())
        
        let searchLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Search", image:  UIImage(named: "magnifyingglass")!)
        liquidTabBar.add(newLiquidTabBarItem: searchLiquidTabItem, withViewController: UIViewController())
        
        let cartLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Cart", image:  UIImage(named: "cart")!)
        liquidTabBar.add(newLiquidTabBarItem: cartLiquidTabItem, withViewController: UIViewController())
        
        let accountLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Account", image:  UIImage(named: "person.crop.circle")!)
        liquidTabBar.add(newLiquidTabBarItem: accountLiquidTabItem, withViewController: UIViewController())
    }
}

