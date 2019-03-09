//
//  ProgressButton.swift
//  ButtonLoader
//
//  Created by alvin joseph valdez on 09/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class ProgressButton: UIView {
    
    public let label: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Progress"
        view.font = UIFont.systemFont(
            ofSize: 15,
            weight: UIFont.Weight.semibold
        )
        view.textColor = UIColor.black
        view.textAlignment = .center
        return view
    }()
    
    public let label2: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Progress"
        view.font = UIFont.systemFont(
            ofSize: 15,
            weight: UIFont.Weight.semibold
        )
        view.textColor = UIColor.black
        view.textAlignment = .center
        return view
    }()
    
    private lazy var mulayer: CALayer = {
        let layer: CALayer = CALayer()
        layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        layer.frame = CGRect(
            x: self.label.frame.minX,
            y: self.label.frame.minY,
            width: 0.0,
            height: self.label.frame.height
        )
        return layer
    }()
    
    private lazy var labelLayer: CALayer = {
        let layer: CALayer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.frame = CGRect(
            x: self.label.frame.minX,
            y: self.label.frame.minY,
            width: self.label.frame.width,
            height: self.label.frame.height
        )
        return layer
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let view: CAGradientLayer = CAGradientLayer()
        view.colors = [UIColor.red, UIColor.red]
        view.locations = [0, 0.5, 1]
        view.frame = CGRect(
            x: self.label.frame.minX,
            y: self.label.frame.minY,
            width: self.label.frame.width,
            height: self.label.frame.height
        )
        view.affineTransform()
        return view
    }()
    
    public lazy var maskingView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.red
        view.frame = CGRect(
            x: self.label.frame.minX,
            y: self.label.frame.minY,
            width: self.label.frame.width,
            height: self.label.frame.height
        )
        return view
    }()
    
    public let labelView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    private var layerWidth: CGFloat = 0.0

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(
            red: 252.0/255.0,
            green: 174.0/255.0,
            blue: 56.0/255.0,
            alpha: 1.0
        )
        
//        self.subviews(forAutoLayout: [self.label2])
//
//        self.label2.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.label.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: self.frame.width,
            height: self.frame.height
        )
        
        self.label2.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: self.frame.width,
            height: self.frame.height
        )
        
//        self.label2.frame = CGRect(
//            x: 0.0,
//            y: 0.0,
//            width: self.frame.width,
//            height: self.frame.height
//        )
        
//        self.labelLayer.frame = self.label.frame
        self.layer.addSublayer(self.mulayer)
        
//        self.mulayer.frame.size = self.frame.size
        
//        let overlayView = UIView(frame: self.label.frame)
//        overlayView.backgroundColor = UIColor.blue
        self.labelView.mask = self.label
        
        self.labelView.frame = CGRect(
            x: self.label.frame.minX,
            y: self.label.frame.minY,
            width: 155.0,
            height: self.label.frame.height
        )
        
        let overlayView2 = UIView(frame: self.label2.frame)
        overlayView2.backgroundColor = UIColor(
            red: 252.0/255.0,
            green: 174.0/255.0,
            blue: 56.0/255.0,
            alpha: 1.0
        )
        overlayView2.mask = self.label2
        
        
        
        self.subviews(forAutoLayout: [overlayView2, self.labelView])
        
        self.bringSubviewToFront(self.labelView)
        
    }
    
    @objc func changeColor(){
        UIView.animate(withDuration: 1.0) {
            
            if self.layerWidth < self.frame.width {
                self.layerWidth += 5.0
            } else {
                self.layerWidth = 0.0
            }
            
            self.mulayer.frame.size.width = self.layerWidth
            
            self.labelView.frame.size.width = self.layerWidth
        }
    }    
}

// MARK: - Public API
extension ProgressButton {
    
    public func start() {
        
        let timer = Timer.scheduledTimer(
            timeInterval: 2.0,
            target: self,
            selector: #selector(ProgressButton.changeColor),
            userInfo: nil,
            repeats: true
        )
        
        timer.fire()
    }
    
}
