//=============================================================================//
//                                                                             //
//  HandRankHeader.swift                                                       //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/27/21.                                      //
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

/// A `HandRank Breakdown`'s header.
struct HandRankHeader: View {

    /// The `HandRankTitle` to display.
    var handRankTitle: HandRankTitle

    /// The `HandRankPoints` to display.
    var handRankPoints: HandRankPoints

    /// The parent container's size/coordinate proxy to adjust for.
    var geo: GeometryProxy
    
    /// The content to display.
    var body: some View {
        HStack(spacing: 0) {
            handRankTitle
                .frame(maxWidth: geo.size.width * 0.90)
            handRankPoints
                .frame(maxWidth: geo.size.width * 0.20)
        }
    }
}

/// The `HandRankHeader`'s preview configuration.
struct HandRankHeader_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        GeometryReader { geo in
            HandRankHeader(
                handRankTitle: HandRankTitle(rank: .fifteen),
                handRankPoints: HandRankPoints(points: 15),
                geo: geo
            )
        }
    }
}
