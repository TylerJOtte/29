//=============================================================================//
//                                                                             //
//  PegsImageRow.swift                                                         //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/16/21.                                      //
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

/// A `CardGridRow` surrounded by `PegsImage`s.
struct PegsImageRow: View {

    /// The models' current data.
    @EnvironmentObject var modelData: ModelData
    
    /// The number of `CardGrid`s to display.
    var cardGridRow: CardGridRow
    
    /// The content to display
    var body: some View {

        GeometryReader { geometry in
            HStack(spacing: 0) {
                PegsImage()
                cardGridRow
                    .frame(width: geometry.size.width * 0.5)
                PegsImage()
            }
        }
    }
}

/// The `PegsImageRow`'s preview configuration.
struct PegsImageRow_Previews: PreviewProvider {
    
//    static let parentWidth = UIScreen.main.bounds.size.width
    static let modelData = ModelData()
    static let startRank = Rank.queen
    static let endRank = Rank.king
    static let cardGrids = modelData.getCardGrids(from: startRank, to: endRank)
    static let cardGridRow = CardGridRow(cardGrids: cardGrids)
    
    /// The content to display.
    static var previews: some View {
        PegsImageRow(cardGridRow: cardGridRow)
            .environmentObject(modelData)
    }
}
