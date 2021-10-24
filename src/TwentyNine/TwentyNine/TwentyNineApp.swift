//=============================================================================//
//                                                                             //
//  TwentyNineApp.swift                                                        //
//  29                                                                         //
//                                                                             //
//  Created by Tyler J. Otte on 9/25/21.                                       //
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

/// The application's main entry point.
@main
struct TwentyNineApp: App {

    //=========================================================================//
    //                                ATTRIBUTES                               //
    //=========================================================================//
    
    /// The models' current data.
    @StateObject private var modelData: ModelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
