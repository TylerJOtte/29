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

    /// The content to display.
    var body: some View {
        GeometryReader { geometry in

            let size = geometry.size
            let isPortrait = size.height > size.width
            let topRowGrids = isPortrait ? 3 : 6
            let nextRowGrids = isPortrait ? 4 : 7

            VStack(spacing: 0) {
                MessagePaneRow(grids: topRowGrids, size: size)
                CardGridRow(grids: nextRowGrids)

                if (isPortrait) {

                    CardGridRow()
                    PegsImageRow(size: size)
                }
            }
        }
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
