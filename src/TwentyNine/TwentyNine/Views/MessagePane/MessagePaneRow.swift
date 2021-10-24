//=============================================================================//
//                                                                             //
//  MessagePaneRow.swift                                                       //
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

/// A `CardGridRow` preceeded by a `MessagePane.`
struct MessagePaneRow: View {

    /// The model's current data.
    @EnvironmentObject var modelData: ModelData

    /// The number of `CardGrid`s to display.
    var cardGridRow: CardGridRow
    
    /// The total # of `CardGrids` and other items.
    private var totalItems: Int {
        
        cardGridRow.cardGrids.count + 1 // +1 for MessagePane
    }
    
    /// The content to display.
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                MessagePane()
                    .frame(width: geometry.size.width / CGFloat(totalItems))
                cardGridRow
            }
        }
    }
}

/// The `MessagePaneRow`'s preview configuration.
struct MessagePaneRow_Previews: PreviewProvider {
    
    /// The model's current data.
    static let modelData = ModelData()
    
    /// The `CardGridRow` to display.
    static let startRank = Rank.ace
    static let endRank = Rank.three
    static let cardGrids = modelData.getCardGrids(from: startRank, to: endRank)
    static let cardGridRow = CardGridRow(cardGrids: cardGrids)
    
    /// The content to display.
    static var previews: some View {
        MessagePaneRow(cardGridRow: cardGridRow)
            .environmentObject(modelData)
    }
}
