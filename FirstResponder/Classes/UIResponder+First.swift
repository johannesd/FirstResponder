//
//  UIResponder+First.swift
//  FirstResponder
//
//  Created by Johannes Dörr on 19.01.18.
//  Copyright © 2018 Johannes Dörr. All rights reserved.
//

import Foundation

extension UIResponder {
    private static weak var _currentFirstResponder: UIResponder?

    public static var first: UIResponder? {
        UIResponder._currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(findFirstResponder(sender:)), to: nil, from: nil, for: nil)
        return UIResponder._currentFirstResponder
    }

    @objc internal func findFirstResponder(sender: AnyObject) {
        UIResponder._currentFirstResponder = self
    }
}
