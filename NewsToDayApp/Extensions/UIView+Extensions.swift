//
//  UIView+Extensions.swift
//  NewsToDayApp
//
//  Created by Админ on 17.05.2023.
//

import Foundation
import UIKit

// расширение позволяющие нам использовать значения по всему коду в формате CGFloat
extension UIView {
    
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + height
    }
}
