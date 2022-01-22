//=============================================================================//
//                                                                             //
//  CornerPip.swift                                                            //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 01/22/21.                                      //
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

/// A corner situated`Pip`.
struct CornerPip: View {
    
    /// The  `CornerPip`'s `PlayingCard`.
    var card: PlayingCard
    
    /// The parent container's geometry.
    var geo: GeometryProxy
    
    // True if rotate, else false
    var rotate = false
    
    /// The content to display.
    var body: some View {

        VStack(spacing: 0) {
            Pip(card: card)
                .frame(maxHeight: geo.size.height * 0.15)
            Spacer()
        }
        .frame(maxWidth: geo.size.width * 0.15)
        .padding(5)
        .rotationEffect(.degrees(rotate ? 180 : 0))
    }
}

/// The `CornerPipText`'s preview configuration.
struct CornerPip_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        GeometryReader  { geo in
            CornerPip(card: try! Ace(of: .hearts), geo: geo)
                .environmentObject(ModelData())
        }
    }
}
