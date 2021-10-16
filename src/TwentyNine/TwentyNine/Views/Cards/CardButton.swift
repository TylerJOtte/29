//=============================================================================//
//                                                                             //
//  CardButton.swift                                                           //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/03/21.                                      //
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

/// A `PlayingCard Button`.
struct CardButton: View {

    /// The `Button`'s `PlayingCard`.
    var card: PlayingCard

    /// True if the `Button` is selected, else false.
    @State private var isSelected = false
    
    /// The content to display.
    var body: some View {
        
        Button(action: {
            self.isSelected.toggle()
        }) {
            Rectangle()
                .fill(isSelected ? Color.tahunaSands : .camarone)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .border(isSelected ? Color.fire : .tundora,
                        width: isSelected ? 2 : 0.2)
                .overlay(SuitImage(suit: card.suit))
        }
    }
}

/// The `CardButton`'s preview configuration.
struct CardButton_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        CardButton(card: try! ModelData().deck.dealCard())
    }
}
