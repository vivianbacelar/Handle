//
//  CardView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 19/10/22.
//

import SwiftUI

struct CardView: View {
    let geometry: GeometryProxy
    let card:Card
    
    @Binding var tapped:Bool
    @Binding var selectedCard:Card
    
    var title:String {card.title}
    var color: Color {card.color}
    var image: String {card.image}
    var imageTutorial: String {card.imageTutorial}
    //    var steps:Int { card.steps }
    
    
    private var rectWidth:CGFloat { geometry.size.width/2.25 }
    private var rectHeight:CGFloat { geometry.size.height*4.5 }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 24)
            .frame(width: rectWidth, height: rectHeight)
            .shadow(radius: 2, y: 4)
            .foregroundColor(color)
            .overlay(
                
                Group{
                    Text(title)
                        .scaledFont(name: "Montserrat-SemiBold", size: 24)
                        .position(x:geometry.size.width/4.5, y:geometry.size.height*3.5)
                        .bold()
                    
                    //
                    //                        Text("\(steps) steps")
                    //                            .scaledFont(name: "system", size: 14)
                    //                            .position(x:geometry.size.width/6, y: geometry.size.height*3.95)
                    //
                    
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(0.62,contentMode: .fit)
                        .position(x:geometry.size.width/4.5, y: geometry.size.height*2.00)
                    
                }
                    .foregroundColor(.white)
)
            .onTapGesture {
                withAnimation(.spring().speed(2)) {
                    tapped.toggle()
                    selectedCard = card
                }
            }
        
    }
}



