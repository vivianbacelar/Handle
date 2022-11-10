//
//  ProgressView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 21/10/22.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @EnvironmentObject var showIntro: Intro
//    @EnvironmentObject var moodVM: MoodViewModel
//    @EnvironmentObject var selectedEmoji: Emoji
    
    
    var body: some View {
        ZStack{
            
            VStack(spacing: 0){
                
                Spacer()
                Spacer()
                Text("Stress Check")
                    .scaledFont(name: "Montserrat-Regular", size: 28)
                    .foregroundColor(Color("Marinho"))
                    .padding(.trailing, 178)
                
                Text("Punctual as usual. But so is your calmzone")
                    .scaledFont(name: "Montserrat-Regular", size: 14)
                    .foregroundColor(Color("Marinho"))
                    .padding(.trailing, 60)


                VStack(alignment: .center){
                    
                    calendar
                    
                    progress
                    
                    
                }
                .frame(maxHeight: .infinity)
                
            }
        }
        .background(Color(hex:0xF2F1EE))
            .onAppear {
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
                AppDelegate.orientationLock = .portrait // And making sure it stays that way
            }
            .onDisappear {
                        AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
                    }
    }
    
    
    var calendar:some View{
        // Calendario
        DatePicker(
            "Start Date",
            selection: $selectedDate,
            displayedComponents: [.date,]
        )
        .aspectRatio(1.5,contentMode: .fit)
        .datePickerStyle(.graphical)
        .background(.white)
        .accentColor(Color("Verde"))
        .cornerRadius(20)
        .padding()
        .shadow(radius:4)
    }
    
    
    var progress: some View{
        // Stress of the day
        RoundedRectangle(cornerRadius: 8)
            .padding()
            .aspectRatio(1.4, contentMode: .fit)
            .foregroundColor(Color(hex:0x5AA091))
            .shadow(radius:4)
            .overlay(
                Group{
                    VStack(spacing: 0){
                        
                        
                        Text("Moodswings")
                            .scaledFont(name: "Montserrat-SemiBold", size: 14)
                            .foregroundColor(Color(hex:0xEFEEEB))
                            .padding([.top, .horizontal],-1)
//                            .background(.red)
//
                        HStack{
                            let (firstMood, secondMood) = MoodModel.getFirstMoods(fromDate: selectedDate)
                            
                            VStack{
                                // ajustar EMOJI com model
                                Text("\(firstMood?.emoji ?? "?")")
                                    .scaledFont(name: "system", size: 28)
                                    .padding()
//                                    .shadow(radius:4)
                                    .clipShape(Circle())
                                    .background(Color(firstMood?.color ?? .white))
                                    .clipShape(Circle())
                                    .shadow(radius: 4)
                                
                                Text("Before")
                                    .scaledFont(name: "Montserrat-SemiBold", size: 14)
                                    .foregroundColor(Color(hex: 0xFFFFFF))
                            }
                            
                            Spacer()
                            
                            VStack{
                                
                                // ajustar EMOJI com model
                                Text("\(secondMood?.emoji ?? "?")")
                                    .scaledFont(name: "system", size: 28)
                                    .padding()
//                                    .shadow(radius:4)
                                    .clipShape(Circle())
                                    .background(Color(secondMood?.color ?? .white))
                                    .clipShape(Circle())
                                    .shadow(radius: 4)

                                
                                
                                    .clipShape(Circle())
                                Text("After")
                                    .scaledFont(name: "Montserrat-SemiBold", size: 14)
                                    .foregroundColor(Color(hex:0xEFEEEB))

                            }
                            
                            
                            
                            
                            
                        }
                        .padding([.bottom, .horizontal])
                        .padding(.horizontal, 60)
                        .frame(alignment: .center)
                        .padding(.bottom, 30)
                        
                        
                    }
                    .padding(.bottom, 30)
                    
                    
                    
                    // Activity of the day
                    VStack{
                        Text("Today's quote was: ")
                            .scaledFont(name: "Montserrat-Medium", size: 12)
                            .foregroundColor(Color(hex:0xEFEEEB))
                            .padding([.top, .horizontal])

                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(hex:0xEFEEEB))
                            .frame(height: 40)
                            .overlay(
                                Text("\(MoodModel.getDayQuote(fromDate: selectedDate) ?? "None :(")")
                                    .font(.custom("Montserrat-Regular", size: 10))
                                    .foregroundColor(Color(hex: 0x6c8c7a))
                                
                            )
//                            .background(.red)
                    }
                    .padding(.top, 140)
                    .padding(40)
                    
                    
                    
                }
            )
    }
    
}



struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(Emoji())
            .environmentObject(Intro())
    }
}
