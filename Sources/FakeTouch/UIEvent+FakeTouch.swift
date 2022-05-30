//
//  UIEvent+FakeTouch.swift
//  FakeTouch
//
//  Created by Watanabe Toshinori on 2/7/19.
//  Copyright © 2019 Watanabe Toshinori. All rights reserved.
//

import Dynamic
import UIKit

extension UIEvent {
    
    public class func send(touches: [UITouch]) {
        guard let event = Dynamic(UIApplication.shared)._touchesEvent() as UIEvent? else {
            return
        }
        
        Dynamic(event)._clearTouches()

        touches.forEach { (touch) in
            Dynamic(event)._addTouch(touch, forDelayedDelivery: false)
        }

        UIApplication.shared.sendEvent(event)
        
        touches.forEach { (touch) in
            if touch.phase == .began || touch.phase == .moved {
                Dynamic(touch).setPhase(UITouch.Phase.stationary)
                Dynamic(touch).udpateTimestamp()
            }
        }
    }
    
}

//extension UIEvent {
//    @objc func _add(_ touch: UITouch?, forDelayedDelivery delayed: Bool) {}
//    @objc func _clearTouches() {}
//}
//
//extension UIApplication {
//    @objc func _touchesEvent() -> UIEvent? { fatalError() }
//}
