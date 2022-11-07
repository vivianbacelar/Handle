//
//  CardView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 19/10/22.
//

import SwiftUI


// MARK: - Vivian
struct CardDetailView: View {
    @Binding var card:Card
    @Environment(\.dismiss) private var dismiss
    @Binding var tapped: Bool
    var title:String {card.title}
    var color:Color {card.color}
    var minutes:String { card.minutes }
    var synopsis: String {card.synopsis}
    var complement: String {card.complement}
    var image: String {card.image}
    var instructions: String {card.instructions}
    var imageTutorial: String {card.imageTutorial}
    var activity: String {card.activity}
    var isUnlocked: Bool {card.isUnlocked}
    
    
    @State var showExerciseView: Bool = false
    @Binding var currentExercise: Exercise
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    tapped.toggle()
                } label: {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color("Verde"))
                            .font(.system(size: 25))
                            .padding(.leading)
                            .padding (.top, -30)
                        Spacer()
                    }
                }
                Spacer()
            }

            RoundedRectangle(cornerRadius: 24)
                .frame(width: 313, height: 440.8)
                .scaledToFit()
                .foregroundColor(color)
                .shadow(radius: 2, y: 4)
                .overlay(
                    Group{
                        VStack{
                            
                            Text(minutes)
                                .scaledFont(name: "Montserrat-SemiBold", size: 16)
                                .foregroundColor(.white)
                            
                            
                            
                            Text(synopsis)
                                .scaledFont(name: "Montserrat-Medium", size: 16)
                                .foregroundColor(.white)
                            
                                .padding(2)
                            
                            
                            
                            Text(complement)
                                .scaledFont(name: "Montserrat-Light", size: 12)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            
                            Image(image)
                                .resizable()
                                .scaledToFit()
                                .aspectRatio(0.75,contentMode: .fit)
                            HStack{
                                
                                NavigationLink {
                                    switch title{
                                    case "Embrace":
                                        EmbraceTutorial(currentExercise: $currentExercise)
                                    case "Expand":
                                        ExpandTutorial(currentExercise: $currentExercise)
                                    case "Grasp":
                                        GraspTutorial()
                                    default:
                                        Text("nada")
                                    }
                                }
                                
                            label: {
                                
                                Group{
                                    Text(title)
                                        .scaledFont(name: "Montserrat-SemiBold", size: 30)
                                        .foregroundColor(.white)
                                    Image(systemName: activity)
                                        .foregroundColor(.white)
                                    
                                }
                                .padding(.bottom)
                                
                                
                            }.tint(.white)
                                    .padding(.bottom)
                            }
                            
                            
                        }
                        
                        
                    }
                        .onAppear {
                            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                            AppDelegate.orientationLock = .portrait // And making sure it stays that way
                        }
                        .onDisappear {
                            AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
                        }
                        .showTabBar()
                        .disabled(!isUnlocked)
                )}
        }
        
}



struct DummyView: View {
    @State var card = Card.placeholder
    
    var body: some View {
        CardDetailView(card: $card, tapped: .constant(false), currentExercise: .constant(.none))
    }
}

//struct CardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        DummyView()
//    }
//}
//
