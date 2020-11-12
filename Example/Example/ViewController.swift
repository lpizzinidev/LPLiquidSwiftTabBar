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

    private let timeout = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLiquidTabBar()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
            // self.liquidTabBar.selectta = 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + (self.timeout * 2)) {
                self.liquidTabBar.selectedTabItem = 2
                
                DispatchQueue.main.asyncAfter(deadline: .now() + (self.timeout * 3)) {
                    self.liquidTabBar.selectedTabItem = 0
                }
            }
        }
    }
    
    private func setupLiquidTabBar()
    {
        liquidTabBar.tabBarItemTintColor = UIColor(named: "primary")!
        liquidTabBar.tabBarSelectedItemTintColor = UIColor(named: "primary")!
        
        liquidTabBar.tabBarItemFont = UIFont.boldSystemFont(ofSize: 17)
        liquidTabBar.tabBarAnimationDuration = 0.4
        
        let homeLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Home", image:  UIImage(systemName: "house")!)
        liquidTabBar.add(newLiquidTabBarItem: homeLiquidTabItem, withViewController: UIViewController())
        
        let searchLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Search", image:  UIImage(systemName: "magnifyingglass")!)
        liquidTabBar.add(newLiquidTabBarItem: searchLiquidTabItem, withViewController: UIViewController())
        
        let cartLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Cart", image:  UIImage(systemName: "cart")!)
        liquidTabBar.add(newLiquidTabBarItem: cartLiquidTabItem, withViewController: UIViewController())
        
        let accountLiquidTabItem = LPLiquidSwiftTabBarItem(title: "Account", image:  UIImage(systemName: "person.crop.circle")!)
        liquidTabBar.add(newLiquidTabBarItem: accountLiquidTabItem, withViewController: UIViewController())
    }
}

