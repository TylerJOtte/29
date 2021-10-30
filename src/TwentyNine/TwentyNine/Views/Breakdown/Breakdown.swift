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
    
    private func getHandRanks(_ handScore: HandScore, _ key: Rank) -> [HandRank] {
        
       
        
        var handRanks = handScore.handRanks[key]!
            
            handRanks.sort(by: {$0.count < $1.count})
        
        return handRanks
    }
    /// The content to display.
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(hex: "454").edgesIgnoringSafeArea(.all)
                ScrollView {
                    let handScore = modelData.hand.score
             
                    
                   
                    let keys = Array(handScore.handRanks.keys)
                    
                    let cards = try! modelData.hand.getNextCard(modelData.hand.count)

                    ForEach(keys, id: \.self) { key in
                        let handRanks = getHandRanks(handScore, key)
                        
                        let title = String(describing: key).capitalized
                        let plural = title.last == "s" ? "" : "s"

                        VStack {

                        
                            VStack {
                                ForEach(handRanks, id: \.self) { handRank in
                            
                                    let handRankCards = try! handRank.getNextCard(handRank.count)
                                    let handCards = cards.filter{handRankCards.contains($0)}
                                    let cardGrids = modelData.getCardGrids(for: handCards)
                                    
                                    VStack {
    //                                    Text("\(handRank.count)")
    //                                    Text("\(handCards.count)")
    //                                    Text("\(cardGrids.count)")
                                        CardGridRow(cardGrids: cardGrids, spacing: 15)
                                            .frame(height: 300)
                                        Text("+ \(handRank.points)")
                                            .font(.system(.title3, design: .serif))
                                            .foregroundColor(Color(hex: "EFECCA"))
                                    }
    //                                    .frame(maxWidth: .infinity)
    //                                    .padding()
    //                                    .background(Color.redGradient)
    //                                    .border(width: 1, edges: [.leading], color: .white)
                                }
                            }
                            .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color.redGradient)
                .clipped()
                .navigationTitle("Breakdown")
            .navigationBarTitleDisplayMode(.inline)
            }
        }
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

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}
