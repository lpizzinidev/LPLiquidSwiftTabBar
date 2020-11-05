//
//  LPLiquidSwiftTabBar.swift
//  LPLiquidSwiftTabBar
//
//  Created by Luca Pizzini on 03/11/2020
//  Copyright © 2020 Luca Pizzini. All rights reserved.
//

import UIKit

@IBDesignable
open class LPLiquidSwiftTabBar : UIView
{
    @IBInspectable
    open var selectedTabItem: Int = 0
    
    @IBInspectable
    open var tabBarHeight: CGFloat = 72
    
    @IBInspectable
    open var tabBarItemTintColor: UIColor = .black
    
    @IBInspectable
    open var tabBarSelectedItemTintColor: UIColor = .black
    
    @objc
    open var tabBarAnimationDuration: Double = 0.25
    
    @objc
    open var tabBarItemFont: UIFont! = UIFont.systemFont(ofSize: 16.0)
    
    private let MAX_TAB_ITEM_NUMBER = 5
    
    private var liquidTabBarContainer: UIStackView!
    
    private var tabBarItemList = [LPLiquidSwiftTabBarItem]()
    private var tabBarVcList = [UIViewController]()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup()
    {
        liquidTabBarContainer = UIStackView()
        
        addSubview(liquidTabBarContainer)
    }
    
    open override func layoutSubviews()
    {
        liquidTabBarContainer.axis = .horizontal
        liquidTabBarContainer.distribution = .fillEqually
        liquidTabBarContainer.alignment = .center
        liquidTabBarContainer.spacing = 0
        
        liquidTabBarContainer.translatesAutoresizingMaskIntoConstraints = false
        
        liquidTabBarContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        liquidTabBarContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        liquidTabBarContainer.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        liquidTabBarContainer.heightAnchor.constraint(equalToConstant: tabBarHeight).isActive = true
    }
    
    @objc
    open func add(newLiquidTabBarItem tabBarItem: LPLiquidSwiftTabBarItem, withViewController vc: UIViewController)
    {
        if tabBarItemList.count >= MAX_TAB_ITEM_NUMBER {
            fatalError("Maximum tab bar items allowed number exceeded")
        }
        
        let isTabSelected = liquidTabBarContainer.arrangedSubviews.count == selectedTabItem
        
        tabBarItem.tabBar = self
        tabBarItem.tabIndex = liquidTabBarContainer.arrangedSubviews.count
        tabBarItem.animationDuration = tabBarAnimationDuration
        tabBarItem.isSelected = isTabSelected
        tabBarItem.tabFont = tabBarItemFont
        
        liquidTabBarContainer.addArrangedSubview(tabBarItem)
        
        liquidTabBarContainer.layoutIfNeeded()
        liquidTabBarContainer.layoutSubviews()
        
        tabBarItemList.append(tabBarItem)
        
        guard let tabBarVc = vc.view else { return }

        addSubview(tabBarVc)
        
        tabBarVc.translatesAutoresizingMaskIntoConstraints = false
        
        tabBarVc.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tabBarVc.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tabBarVc.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -tabBarHeight).isActive = true
        tabBarVc.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        tabBarVc.isHidden = !isTabSelected
        
        tabBarVcList.append(vc)
    }
    
    func selectTab(atIndex index: Int)
    {
        guard index < tabBarItemList.count && index < tabBarVcList.count else {
            fatalError("Index out of range. Selected tab \(index) with \(tabBarItemList.count) items")
        }
        
        self.selectedTabItem = index
        
        selectTabItem()
        selectViewController()
    }
    
    private func selectTabItem()
    {
        if !tabBarItemList[selectedTabItem].isSelected {
            tabBarItemList.forEach { (tabItem) in
                if tabItem.isSelected {
                    tabItem.isSelected = false
                }
            }
            
            tabBarItemList[selectedTabItem].isSelected = true
        }
    }
    
    private func selectViewController()
    {
        for (vcIndex, vcChild) in tabBarVcList.enumerated()
        {
            let isSelected = vcIndex == self.selectedTabItem
            
            UIView.animate(
                withDuration: self.tabBarAnimationDuration,
                delay: 0.0,
                options: .curveEaseInOut)
            {
                if isSelected {
                    vcChild.view.isHidden = false
                }
                
                vcChild.view.alpha = isSelected ? 1.0 : 0.0
            } completion: { (_) in
                vcChild.view.isHidden = !isSelected
            }
        }
    }
}
