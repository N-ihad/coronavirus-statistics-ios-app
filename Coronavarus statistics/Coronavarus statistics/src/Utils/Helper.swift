//
//  Helper.swift
//  Coronavarus statistics
//
//  Created by Nihad on 1/1/21.
//

import UIKit

struct Helper {
    static func makeLoadingView() -> UIView {
        let loadingOverlay = UIView()
        loadingOverlay.contentMode = .scaleAspectFit
        loadingOverlay.backgroundColor = .black
        loadingOverlay.alpha = 0.5
        loadingOverlay.isUserInteractionEnabled = true
        loadingOverlay.layer.zPosition = 1

        let loadingLayer = CAReplicatorLayer()
        loadingLayer.frame = CGRect(x: -10, y: 0, width: 100, height: 10)

        let circle = CALayer()
        circle.frame = CGRect(x: -10, y: 0, width: 10, height: 10)
        circle.backgroundColor = UIColor.gray.cgColor
        circle.cornerRadius = 10 / 2
        loadingLayer.addSublayer(circle)
        loadingLayer.instanceCount = 3
        loadingLayer.instanceTransform = CATransform3DMakeTranslation(20, 0, 0)

        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.fromValue = 1.0
        animation.toValue = 0.2
        animation.duration = 1
        animation.repeatCount = .infinity
        circle.add(animation, forKey: nil)
        loadingLayer.instanceDelay = animation.duration / Double(loadingLayer.instanceCount)

        let view = UIView()
        view.layer.addSublayer(loadingLayer)
        loadingOverlay.addSubview(view)
        view.center(inView: loadingOverlay)

        return loadingOverlay
    }
}
