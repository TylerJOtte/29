//=============================================================================//
//                                                                             //
//  BreakdownButton.swift                                                      //
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

/// A `Button` for navigating to the `Breakdown` view.
struct BreakdownButton: View {
    
    /// True fi the `BreakdownButton` is active, else false.
    @State private var isActive = false
        
    /// The content to display.
    var body: some View {
        NavigationLink(destination: Breakdown()) {
            MessagePaneButton(title: "Breakdown")
        }
    }
}

/// The `BreakdownButton`'s preview configuration.
struct BreakdownButton_Previews: PreviewProvider {
    
    /// The content to display.
    static var previews: some View {
        BreakdownButton()
            .environmentObject(ModelData())
    }
}
