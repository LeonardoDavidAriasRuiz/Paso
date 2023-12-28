//
//  Color.swift
//  Paso
//
//  Created by Leonardo on 27/12/23.
//

import SwiftUI

extension UIColor {
    // Convierte UIColor a una representación de cadena
    func toRGBAString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return "\(red) \(green) \(blue) \(alpha)"
    }

    // Crea UIColor a partir de una representación de cadena
    static func fromRGBAString(_ rgba: String) -> UIColor? {
        let components = rgba.split(separator: " ").compactMap { Double($0) }
        
        guard components.count == 4 else { return nil }
        
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components[3]
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
