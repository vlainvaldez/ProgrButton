//
//  MainVC.swift
//  ButtonLoader
//
//  Created by alvin joseph valdez on 09/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {

    public override func loadView() {
        super.loadView()
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()        
        
        let gesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(MainVC.progressTapped)
        )
        
        self.rootView.progressButton.addGestureRecognizer(gesture)
    }
}

extension MainVC {
    private var rootView: MainView { return self.view as! MainView }
    
    @objc func progressTapped() {
        self.rootView.progressButton.start()
    }
}
