//=============================================================================//
//                                                                             //
//  Breakdown.swift                                                            //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 10/23/21.                                      //
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

/// A `CribbageHand`s `HandRankScore` breakdown.
struct Breakdown: View {
    
    /// The model's current data.
    @EnvironmentObject var modelData: ModelData
    
    /// The content to display.
    var body: some View {
        ScrollView {
            VStack {
                Text("")
                
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.redGradient)
        .clipped()
        .navigationTitle("Breakdown")
        .navigationBarTitleDisplayMode(.inline)
    }
}

/// The `HandBreakdown`'s preview configuration.
struct Breakdown_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        Breakdown()
            .environmentObject(ModelData())
    }
}
