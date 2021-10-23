//=============================================================================//
//                                                                             //
//  CardGrid.swift                                                             //
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

/// A `PlayingCard` grid.
struct CardGrid: View {

    /// The `CardRow`s to display.
    var rows: [CardRow]
    
    /// The first `CardButton`'s `PlayingCard`.
    private var firstCard: PlayingCard? {
    
        rows.first?.buttons.first?.card
    }
    
    /// The `PlayingCardRank` for all contained `CardButtons`.
    internal var rank: Rank? {
        
        firstCard?.rank
    }
    
    /// The content to display.
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<rows.count) { row in
                    rows[row]
                }
            }
            
            PipText(pip: firstCard?.pip ?? "")
                .scaleEffect(0.55)
                .scaledToFit()
        }
        .border(Color.black, width: 0.5)
    }
}

/// The `CardGrid`'s preview configuration.
struct CardGrid_Previews: PreviewProvider {

    static var modelData: ModelData = ModelData()
    
    /// The `CardButton`s to display.
    static var buttons = try! modelData.deck
        .getNextCard(4)
        .map{ CardButton(card: $0)}
    
    /// The content to display.
    static var previews: some View {
        CardGrid(rows: [
            CardRow(buttons: [buttons[0], buttons[1]]),
            CardRow(buttons: [buttons[2], buttons[3]])
        ])
        .environmentObject(modelData)
    }
}
