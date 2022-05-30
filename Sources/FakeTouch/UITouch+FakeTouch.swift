//
//  UITouch+Simulate.swift
//  FakeTouch
//
//  Created by Watanabe Toshinori on 2/6/19.
//  Copyright © 2019 Watanabe Toshinori. All rights reserved.
//

import Dynamic
import UIKit

extension UITouch {
    
    public var id: String {
        return String(format: "%p", unsafeBitCast(self, to: Int.self))
    }
    
    // MARK: - Initialize UITouch
    
    convenience public init(with location: CGPoint, in window: UIWindow) {
        self.init()
        
        let view = window.hitTest(location, with: nil)

        let obj = Dynamic(self)
        obj.setWindow(window)
        obj.setView(view)
        obj.setTapCount(1)
        obj.setPhase(UITouch.Phase.began)
        obj._setIsFirstTouch(forView: true)
        // obj.setIsTap(true)

        obj._setLocation(inWindow: location, resetPrevious: true)
        obj.setTimestamp(ProcessInfo.processInfo.systemUptime)

        if responds(to: Selector(("setGestureView:"))) {
            obj.setGestureView(view)
        }
    }
    
    // MARK: - Updating values

    @objc
    public func setLocation(_ location: CGPoint) {
        Dynamic(self)._setLocation(inWindow: location, resetPrevious: true)
    }

    @objc
    public func udpateTimestamp() {
        Dynamic(self).setTimestamp(ProcessInfo.processInfo.systemUptime)
    }
    
}

//extension UITouch {
//    @objc func setPhase(_ touchPhase: UITouch.Phase) {}
//    @objc func setTapCount(_ tapCount: Int) {}
//    @objc func setWindow(_ window: UIWindow?) {}
//    @objc func setView(_ view: UIView?) {}
//    @objc func _setLocation(inWindow location: CGPoint, resetPrevious: Bool) {}
//    @objc func _setIsFirstTouch(forView firstTouchForView: Bool) {}
//    @objc func setIsTap(_ isTap: Bool) {}
//    @objc func setTimestamp(_ timestamp: TimeInterval) {}
//    @objc func setGestureView(_ view: UIView?) {}
//}
