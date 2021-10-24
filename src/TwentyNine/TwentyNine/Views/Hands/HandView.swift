//=============================================================================//
//                                                                             //
//  HandView.swift                                                             //
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

/// A `CribbageHand` selection `View`.
struct HandView: View {

    /// The models' current data.
    @EnvironmentObject var modelData: ModelData

    /// The content to display.
    var body: some View {
        GeometryReader { geometry in

            let size = geometry.size
            let width = size.width
            let isPortrait = size.height > width
  
            NavigationView {
                VStack(spacing: 0) {
                    MessagePaneRow(cardGridRow: getRow1CardGridRow(isPortrait))
                    CardGridRow(cardGrids: getRow2CardGrids(isPortrait))

                    if (isPortrait) {

                        CardGridRow(cardGrids: getRow3CardGrids())
                        PegsImageRow(cardGridRow: getRow4CardGridRow())
                    }
                }
                .navigationBarHidden(true)
                .navigationTitle("Hand")
            }
        }
    }
    
    //=========================================================================//
    //                                  GETTERS                                //
    //=========================================================================//
    
    /// Retrieves the `CardGridRow` for row one with respect for the given portrait status.
    ///
    /// - Precondition: None.
    /// - Postcondition : None.
    /// - Parameter isPortrait: True if device is in portrait mode, else false.
    /// - Returns: A `CardGridRow` from an `ace` to `three` if portrait, else `ace` to `six`.
    private func getRow1CardGridRow(_ isPortrait: Bool) -> CardGridRow {
        
        let startRank = Rank.ace
        let endRank = isPortrait ? Rank.three : Rank.six
        let cardGrids = modelData.getCardGrids(from: startRank, to: endRank)
        
        return CardGridRow(cardGrids: cardGrids)
    }
    
    /// Retrieves the `CardGridRow` for row two with respect for the given portrait status.
    ///
    /// - Precondition: None.
    /// - Postcondition : None.
    /// - Parameter isPortrait: True if device is in portrait mode, else false.
    /// - Returns: A `CardGridRow` from a `four` to `seven` if portrait, else `seven` to `king`.
    private func getRow2CardGrids(_ isPortrait: Bool) -> [CardGrid] {
        
        let startRank = isPortrait ? Rank.four : Rank.seven
        let endRank = isPortrait ? Rank.seven : Rank.king
        
        return modelData.getCardGrids(from: startRank, to: endRank)
    }
    
    /// Retrieves the `CardGridRow` for row three.
    ///
    /// - Precondition: None.
    /// - Postcondition : None.
    /// - Returns: A `CardGridRow` from a `eight` to `jack`.
    private func getRow3CardGrids() -> [CardGrid] {
        
        let startRank = Rank.eight
        let endRank = Rank.jack
        
        return modelData.getCardGrids(from: startRank, to: endRank)
    }
    
    /// Retrieves the `CardGridRow` for row four.
    ///
    /// - Precondition: None.
    /// - Postcondition : None.
    /// - Returns: A `CardGridRow` from a `queen` to `king`.
    private func getRow4CardGridRow() -> CardGridRow {
        
        let startRank = Rank.queen
        let endRank = Rank.king
        let cardGrids = modelData.getCardGrids(from: startRank, to: endRank)
        
        return CardGridRow(cardGrids: cardGrids)
    }
}

/// The `HandView`'s preview configuration.
struct HandView_Previews: PreviewProvider {

    /// The content to display.
    static var previews: some View {
        Group {
            HandView()
                .environmentObject(ModelData())

//            HandView()
//                .previewInterfaceOrientation(.landscapeLeft)
//                .environmentObject(ModelData())
        }
    }
}
