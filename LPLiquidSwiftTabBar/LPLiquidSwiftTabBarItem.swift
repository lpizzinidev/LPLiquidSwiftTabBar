//
//  LPLiquidSwiftTabBarItem.swift
//  LPLiquidSwiftTabBar
//
//  Created by Luca Pizzini on 03/11/2020
//  Copyright © 2020 Luca Pizzini. All rights reserved.
//

import UIKit

public class LPLiquidSwiftTabBarItem : UIView
{
    private let fillLayer = CAShapeLayer()
    
    private let tabLabel = UILabel()
    private let tabIcon = UIImageView()
    
    private var title = ""
    private var image = UIImage()
    
    var tabIndex: Int!
    var tabBar: LPLiquidSwiftTabBar!
    var animationDuration: Double!
    var isSelected = false {
        didSet {
            animate()
        }
    }
    
    var tabFont: UIFont!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public init(title: String, image: UIImage) {
        super.init(frame: .zero)
        
        self.title = title
        self.image = image
    }
    
    private var alreadySetup = false
    open override func layoutSubviews()
    {
        setup()
    }
    
    private func setup()
    {
        if !alreadySetup {
            translatesAutoresizingMaskIntoConstraints = false
            
            widthAnchor.constraint(equalToConstant: frame.width).isActive = true
            heightAnchor.constraint(equalToConstant: tabBar.tabBarHeight).isActive = true
            
            layer.insertSublayer(self.fillLayer, at: 0)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tabClicked))
        self.addGestureRecognizer(tapGesture)
        
        setupTabLabel()
        setupTabIcon()
        
        let newShapePath = (isSelected ? liquidTabShapePath() : liquidTabShapePathClosed()).cgPath
        if newShapePath != fillLayer.path {
            fillLayer.path = newShapePath
            fillLayer.fillColor = tabBar.tabBarSelectedItemTintColor.cgColor
        }
        
        alreadySetup = true
    }
    
    private func setupTabLabel()
    {
        let labelTint = isSelected ? tabBar.tabBarSelectedItemTintColor : tabBar.tabBarItemTintColor
        
        let frameOffset = 2.0 * self.frame.height / 3.0
        let labelFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: frameOffset)
        
        tabLabel.text = title
        tabLabel.textAlignment = .center
        
        tabLabel.frame = labelFrame
        tabLabel.textColor = labelTint
        tabLabel.font = tabFont
        tabLabel.isHidden = !isSelected
        tabLabel.layoutIfNeeded()
        
        
        self.addSubview(tabLabel)
    }
    
    private func setupTabIcon()
    {
        let iconTint = isSelected ? tabBar.tabBarSelectedItemTintColor : tabBar.tabBarItemTintColor
        
        let frameOffset = 2.0 * self.frame.height / 3.0
        let iconFrame = CGRect(x: 0, y: frameOffset / 4.0, width: self.frame.width, height: frameOffset / 2.0)
        
        tabIcon.image = image.withRenderingMode(.alwaysTemplate)
        tabIcon.contentMode = .scaleAspectFit
        
        tabIcon.frame = iconFrame
        tabIcon.tintColor = iconTint
        tabIcon.isHidden = isSelected
        tabIcon.layoutIfNeeded()
        
        self.addSubview(tabIcon)
    }
    
    private func liquidTabShapePath() -> UIBezierPath
    {
        let curveOffset: CGFloat = self.frame.width / 4.0
        let curveHeight: CGFloat = 2.0 * self.frame.height / 3.0
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: self.frame.height))
        bezierPath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        bezierPath.addCurve(
            to: CGPoint(x: self.frame.width / 2, y: curveHeight),
            controlPoint1: CGPoint(x: self.frame.width - curveOffset, y: self.frame.height),
            controlPoint2: CGPoint(x: self.frame.width - curveOffset, y: curveHeight)
        )
        bezierPath.addCurve(
            to: CGPoint(x: 0, y: self.frame.height),
            controlPoint1: CGPoint(x: curveOffset, y: curveHeight),
            controlPoint2: CGPoint(x: curveOffset, y: self.frame.height)
        )
        
        return bezierPath
    }
    
    private func liquidTabShapePathClosed() -> UIBezierPath
    {
        let curveOffset: CGFloat = self.frame.width / 4.0
        let curveHeight: CGFloat = self.frame.height
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: self.frame.height))
        bezierPath.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        bezierPath.addCurve(
            to: CGPoint(x: self.frame.width / 2, y: curveHeight),
            controlPoint1: CGPoint(x: self.frame.width - curveOffset, y: self.frame.height),
            controlPoint2: CGPoint(x: self.frame.width - curveOffset, y: curveHeight)
        )
        bezierPath.addCurve(
            to: CGPoint(x: 0, y: self.frame.height),
            controlPoint1: CGPoint(x: curveOffset, y: curveHeight),
            controlPoint2: CGPoint(x: curveOffset, y: self.frame.height)
        )
        
        return bezierPath
    }
    
    private func animate()
    {
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            self.layoutSubviews()
        }
        
        let timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = (isSelected ? liquidTabShapePathClosed() : liquidTabShapePath()).cgPath
        animation.toValue = (isSelected ? liquidTabShapePath() : liquidTabShapePathClosed()).cgPath
        animation.duration = self.animationDuration
        animation.timingFunction = timingFunction
        
        fillLayer.add(animation, forKey: "")
        
        CATransaction.commit()
        
        UIView.animate(
            withDuration: self.animationDuration,
            delay: 0.0,
            options: .curveEaseInOut)
        {
            self.tabLabel.alpha = self.isSelected ? 1.0 : 0.0
            self.tabIcon.alpha = self.isSelected ? 0.0 : 1.0
        } completion: { (_) in
            self.tabLabel.isHidden = !self.isSelected
            self.tabIcon.isHidden = self.isSelected
        }

    }
    
    @objc
    private func tabClicked()
    {
        self.tabBar.selectTab(atIndex: tabIndex)
    }
}
