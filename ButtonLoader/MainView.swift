//
//  MainView.swift
//  ButtonLoader
//
//  Created by alvin joseph valdez on 09/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class MainView: UIView {
    
    public let progressButton: ProgressButton = {
        let view: ProgressButton = ProgressButton()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        
        self.subviews(forAutoLayout: [self.progressButton])
        
        self.progressButton.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.height.equalTo(60.0)
            make.width.equalTo(300.0)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.progressButton.layer.cornerRadius = 10.0
        self.progressButton.layer.masksToBounds = true
    }
}
