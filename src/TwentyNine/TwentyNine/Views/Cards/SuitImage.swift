//=============================================================================//
//                                                                             //
//  SuitImage.swift                                                            //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/04/21.                                      //
//-----------------------------------------------------------------------------//
//                                                                             //
// This source file is part of the 29 project.                                 //
//                                                                             //
// Copyright (c) 2021, Tyler J. Otte.                                          //
// Licensed under the GNU Affero General Public License v3.0.                  //
//                                                                             //
// See https://github.com/TylerJOtte/29/LICENSE.txt for more details.          //
//=============================================================================//

import SwiftUI
import Forge

/// A `Suit`'s `ImageView`.
struct SuitImage: View {
    
    /// The `Suit` to configure `ImageView` for.
    var suit: Suit
    
    /// The filename of the `Suit`'s image.
    private var imageName: String {
        
        "\(suit)".dropLast().capitalized
    }
    
    /// The content to display
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .padding(5)
            .shadow(radius: 7)
    }
}

/// The `SuitImage`'s preview configuration.
struct SuitImage_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        SuitImage(suit: Suit.hearts)
        
    }
}
