//=============================================================================//
//                                                                             //
//  PipText.swift                                                              //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/30/21.                                      //
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

/// A `PlayingCard`'s token and `SuitImage`.
struct Pip: View {
    
    /// The  `Pip`'s `PlayingCard`.
    var card: PlayingCard
    
    /// The content to display.
    var body: some View {
        
        GeometryReader  { geo in
            VStack(spacing: 0) {
                PipText(pip: card.pip)
                    .frame(
                        maxWidth: geo.size.width,
                        maxHeight: geo.size.height / 2
                    )
                SuitImage(suit: card.suit)
                    .frame(
                        maxWidth: geo.size.width,
                        maxHeight: geo.size.height / 2
                    )
            }
        }
    }
}

/// The `PipText`'s preview configuration.
struct Pip_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        Pip(card: try! Ace(of: .hearts))
            .environmentObject(ModelData())
    }
}
