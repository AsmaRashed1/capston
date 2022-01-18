//
//  File.swift
//  KidsApp
//
//  Created by Asma Rasheed on 06/01/2022.
//

import UIKit
import SwiftUI

//MARK:- cornerRadius

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}


