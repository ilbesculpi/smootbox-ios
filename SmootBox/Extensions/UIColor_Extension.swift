//
//  UIColor_Extension.swift
//  SmootBox
//
//  Created by Ilbert Esculpi on 7/5/19.
//  Copyright © 2019 SmootBox. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha:1);
    }
    
    convenience init(hex: String, alpha: CGFloat) {
        
        var hexWithoutSymbol = hex
        
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = hex.substring(1)
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.count) {
            case 3: // #RGB
                r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
                g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
                b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
                break;
            case 6: // #RRGGBB
                r = (hexInt >> 16) & 0xff
                g = (hexInt >> 8) & 0xff
                b = hexInt & 0xff
                break;
            default:
                // Error: Return #000000
                r = 0x00
                g = 0x00
                b = 0x00
                break;
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha
        );
        
    }
    
    
    // MARK: - Color Scheme
    
    static let primaryColor: UIColor = UIColor(hex: "#44C2C7");
    
    static let primaryDarkColor: UIColor = UIColor(hex: "#16838F");
    
    static let primaryLightColor: UIColor = UIColor(hex: "#C6E2E0");
    
    static let accentColor: UIColor = UIColor(hex: "#F06136");
    
    static let inverseColor: UIColor = UIColor(hex: "#F5CA87");
    
    static let textColor: UIColor = UIColor(hex: "#333333");
    
}
