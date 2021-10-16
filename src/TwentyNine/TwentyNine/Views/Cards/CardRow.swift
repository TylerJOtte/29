//=============================================================================//
//                                                                             //
//  CardRow.swift                                                              //
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

/// A row of `PlayingCard`s.
struct CardRow: View {
    
    /// The `CardButton`s to display.
    var buttons: [CardButton]

    /// The content to display.
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<buttons.count) { button in
                buttons[button]
            }
        }
    }
}

/// The `CardRow`'s preview configuration.
struct CardRow_Previews: PreviewProvider {
    
    /// The `CardButton`s to display.
    static var buttons = try! ModelData().deck
        .dealCards(2)
        .map{ CardButton(card: $0)}
    
    /// The content to display.
    static var previews: some View {
        CardRow(buttons: buttons)
    }
}
