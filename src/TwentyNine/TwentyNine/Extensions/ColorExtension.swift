//=============================================================================//
//                                                                             //
//  ColorExtension.swift                                                       //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 09/04/21.                                      //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the 29 project.                                 //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/29/LICENSE.txt for more details.          //
//=============================================================================//

import Foundation
import SwiftUI

/// An extension  for common `Color` operations.
internal extension Color {
    
    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// Scheme colors
    static let camarone: Color = Color(hex: "006600")
    static let fire: Color = Color(hex: "AF2A00")
    static let gray: Color = Color(hex: "808080")
    static let indianTan: Color = Color(hex: "581500")
    static let tahunaSands: Color = Color(hex: "EFECCA")
    static let tundora: Color = Color(hex: "454545")
    
    // Scheme gradients
    static let redGradient = getGradient(fire, indianTan)
    static let whiteGradient = getGradient(.white, gray)
    
    //=========================================================================//
    //                              CONSTRUCTORS                               //
    //=========================================================================//
    
    /// Creates a `Color` with the given HEX value.
    ///
    /// - Precondition: The given value must be a valid 6-character HEX value.
    /// - Postcondition: A `Color` is created from the given HEX value.
    /// - Parameter hex: The 6-character HEX value to create `Color` for.
    init(hex: String) {
        
        let characterSet = CharacterSet.alphanumerics.inverted
        let value = hex.trimmingCharacters(in: characterSet)
        var base: UInt64 = 0
        
        Scanner(string: value).scanHexInt64(&base)
        let alpha, red, green, blue: UInt64
        
        switch value.count {
        
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (
                255,
                (base >> 8) * 17,
                (base >> 4 & 0xF) * 17,
                (base & 0xF) * 17
            )
            
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (
                255,
                base >> 16,
                base >> 8 & 0xFF,
                base & 0xFF
            )
            
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (
                base >> 24,
                base >> 16 & 0xFF,
                base >> 8 & 0xFF,
                base & 0xFF)
            
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue:  Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }
    
    //=========================================================================//
    //                                 GETTERS                                 //
    //=========================================================================//
    
    /// Retrieve a `LindearGradient` with the given colors and coordinates.
    ///
    /// - Precondition: None.
    /// - Postcondition: None.
    /// - Parameters:
    ///   - startColor: The `Color` to commence gradent with.
    ///   - endColor: The `Color` to end gradient with.
    ///   - x: The start point's x-axis point.
    ///   - y: The start point's y-axis point.
    ///   - x2: The end point's x-axis point.
    ///   - y2: The end point's y-axis point.
    /// - Returns: A `LinearGradient` for the given terms.
    private static func getGradient(_ startColor: Color, _ endColor: Color,
                                    _ x: CGFloat = 0, _ y: CGFloat = 0,
                                    _ x2: CGFloat = 0.5, _ y2: CGFloat = 0.6) ->
                                    LinearGradient {
     
        return LinearGradient(
            gradient:   .init(colors: [startColor, endColor]),
            startPoint: .init(x: x, y: y),
            endPoint:   .init(x: x2, y: y2))
    }
}
