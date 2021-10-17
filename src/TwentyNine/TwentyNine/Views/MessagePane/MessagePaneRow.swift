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

/// A `CardGridRow` preceeded by a `MessagePane.`
struct MessagePaneRow: View {
    
    /// The number of `CardGrid`s to display.
    var grids: Int = 3
    
    /// The size to constrain by.
    var size = UIScreen.main.bounds.size
    
    /// The content to display.
    var body: some View {
        
        HStack(spacing: 0) {
            MessagePane()
                .frame(maxWidth:  size.width / (CGFloat(grids) + 1))
            CardGridRow(grids: grids)

        }
    }
}

/// The `MessagePaneRow`'s preview configuration.
struct MessagePaneRow_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        MessagePaneRow()
            .environmentObject(ModelData())
        
    }
}
