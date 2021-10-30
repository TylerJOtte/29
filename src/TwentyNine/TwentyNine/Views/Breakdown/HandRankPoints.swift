//=============================================================================//
//                                                                             //
//  HandRankPoints.swift                                                       //
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

/// A `HandRank Breakdown`'s points.
struct HandRankPoints: View {
    
    /// The `HandRank`'s points to display.
    var points: Int
    
    /// The content to display.
    var body: some View {
        Text("+ \(points)")
            .frame(maxWidth: .infinity)
            .padding()
            .font(.system(.title2, design: .serif))
            .background(Color.redGradient)
            .foregroundColor(.white)
            .border(.white, width: 0.5)
    }
}

/// The `HandRankPoint`'s preview configuration.
struct HandRankPoints_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        HandRankPoints(points: 16)
    }
}
