//=============================================================================//
//                                                                             //
//  CardView.swift                                                             //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 01/01/22.                                      //
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

/// A `PlayingCard View`
struct CardView: View {
    
    /// The `View`'s `PlayingCard`.
    var card: PlayingCard
    
    /// The content to display.
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                CornerPip(card: card, geo: geo)
                SuitImage(suit: card.suit)
                CornerPip(card: card, geo: geo, rotate: true)
            }
            .background(Color.camarone)
            .border(Color.tundora, width: 0.23)
        }
    }
}

/// The `PipText`'s preview configuration.
struct CardView_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        CardView(card: try! Ace(of: .hearts))
            .environmentObject(ModelData())
    }
}
