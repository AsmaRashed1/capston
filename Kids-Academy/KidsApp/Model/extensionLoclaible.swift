//
//  exttintionLoclaible.swift
//  KidsApp
//
//  Created by Asma Rasheed on 13/06/1443 AH.
//

import Foundation


//MARK:- localizable

extension String {
  var localized: String {
    return NSLocalizedString(self, comment: "")
  }
}
