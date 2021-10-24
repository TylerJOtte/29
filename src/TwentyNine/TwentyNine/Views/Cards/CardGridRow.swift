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

    /// The models' current data.
    @EnvironmentObject var modelData: ModelData
    
    /// The `CardGrid`s to display in the row.
    var cardGrids: [CardGrid]

    /// The content to display.
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<cardGrids.count) { cardGrid in
                cardGrids[cardGrid]
            }
        }
    }
}

/// The `CardGridRow`'s preview configuration.
struct CardGridRow_Previews: PreviewProvider {
    
    /// The model's current data.
    static let modelData = ModelData()
    
    /// The content to display.
    static var previews: some View {
        CardGridRow(cardGrids: modelData.getCardGrids(from: .ace, to: .three))
            .environmentObject(modelData)
    }
}
