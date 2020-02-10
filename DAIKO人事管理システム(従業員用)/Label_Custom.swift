//
//  Label_Custom.swift
//  DAIKO人事管理システム(従業員用)
//
//  Created by Sora Sawai on 2020/02/08.
//  Copyright © 2020 Sora Sawai. All rights reserved.
//

import UIKit
@IBDesignable
class Label_Custom: UILabel {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
     
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
     
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}

