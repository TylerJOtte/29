//=============================================================================//
//                                                                             //
//  CardGridRow.swift                                                          //
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

/// A row of `PlayingCard` grids.
struct CardGridRow: View {

    /// The grids to display.
    var grids: [CardGrid]

    /// The content to display.
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<grids.count) { grid in
                grids[grid]
            }
        }
    }
}

/// The `CardGridRow`'s preview configuration.
struct CardGridRow_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        CardGridRow(grids: Array(ModelData().deckGrids.prefix(4)))
    }
}
