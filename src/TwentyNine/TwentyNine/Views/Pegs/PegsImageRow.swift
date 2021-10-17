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

/// A `CardGridRow` surrounded by `PegsImage`s.
struct PegsImageRow: View {
    
    /// The number of `CardGrid`s to display.
    var grids: Int = 2
    
    /// The content to display
    var body: some View {
        
        GeometryReader { geometry in
            
            HStack(spacing: 0) {
                PegsImage()
                CardGridRow(grids: 2)
                    .frame(width: geometry.size.width * 0.5)
                PegsImage()
            }
        }
    }
}

/// The `PegsImageRow`'s preview configuration.
struct PegsImageRow_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        PegsImageRow()
            .environmentObject(ModelData())
    }
}
