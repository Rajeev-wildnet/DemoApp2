//
//  Extension.swift
//  DemoApp
//
//  Created by Rajeev on 24/09/17.
//  Copyright © 2017 Wildnet. All rights reserved.
//

import UIKit

extension UIImageView {
    func setCornerRadius(value:CGFloat){
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}
