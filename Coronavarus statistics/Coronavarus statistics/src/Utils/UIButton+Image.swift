//
//  UIButton+Image.swift
//  Coronavarus statistics
//
//  Created by Nihad on 11/7/21.
//

import Foundation
import UIKit

extension UIButton {
    func setImageWithSize(size: CGFloat, systemImgName: String) {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: size, weight: .bold, scale: .large)
        let img = UIImage(systemName: systemImgName, withConfiguration: largeConfig)
        setImage(img, for: .normal)
    }
}
