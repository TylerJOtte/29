//=============================================================================//
//                                                                             //
//  ContentView.swift                                                          //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 09/25/21.                                      //
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

/// The top-level `View` in the `View` hierarchy.
struct ContentView: View {
    
    /// The models' current data.
    @EnvironmentObject var modelData: ModelData
    
    /// The content to display
    var body: some View {
        
        Text("Hello world.")
    }
}

/// `ContentView`'s preview configuration.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
