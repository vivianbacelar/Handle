//
//  ProgressView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 21/10/22.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    @EnvironmentObject var selectedEmoji: Emoji
    
    
    var body: some View {
        ZStack{
            
            VStack{
                
                Spacer()
                Spacer()
                Text("Stress Check")
                    .scaledFont(name: "Montserrat-Light", size: 28)
                    .padding(.trailing, 178)
                
                Text("Punctual as usual. But is your calmzone")
                    .scaledFont(name: "Montserrat-Light", size: 14)
                    .padding(.trailing, 75)
                
                
                VStack{
                    
                    calendar
                    
                    progress
                    
                    
                }.frame(maxHeight: .infinity)
                
            }
        }.background(Color(hex:0xF2F1EE))
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
        .cornerRadius(20)
        .padding()
        .shadow(radius:4)
    }
    
    
    var progress: some View{
        // Stress of the day
        RoundedRectangle(cornerRadius: 8)
            .padding()
            .aspectRatio(1.8, contentMode: .fit)
            .foregroundColor(Color(hex:0x5AA091))
            .shadow(radius:4)
            .overlay(
                Group{
                    VStack{
                        
                        
                        Text("Stress of the day")
                            .scaledFont(name: "Montserrat-Medium", size: 14)
                            .foregroundColor(Color(hex:0xEFEEEB))
                            .padding()
                        
                        HStack{
                            
                            VStack{
                                
                                // ajustar EMOJI com model
                                Text("\(selectedEmoji.antes)")
                                    .scaledFont(name: "system", size: 28)
                                    .clipShape(Circle())
                                    .background(selectedEmoji.colorAntes)
                                    .clipShape(Circle())
                                
                                Text("Before")
                                    .scaledFont(name: "Montserrat-SemiBold", size: 14)
                                    .foregroundColor(Color(hex: 0xFFFFFF))
                            }
                            
                            Spacer()
                            
                            VStack{
                                
                                // ajustar EMOJI com model
                                Text("\(selectedEmoji.depois)")
                                    .scaledFont(name: "system", size: 28)
                                    .clipShape(Circle())
                                    .background(selectedEmoji.colorDepois)
                                
                                
                                    .clipShape(Circle())
                                Text("After")
                                    .scaledFont(name: "Montserrat-SemiBold", size: 14)
                                    .foregroundColor(Color(hex:0xEFEEEB))

                            }
                            
                            
                            
                            
                            
                        }
                        .padding()
                        .padding(.horizontal, 60)
                        .frame(alignment: .center)
                        .padding(.bottom, 30)
                        
                        
                    }
                    .padding(.bottom, 30)
                    
                    
                    
                    // Activity of the day
                    RoundedRectangle(cornerRadius: 20)
                        .aspectRatio(10, contentMode: .fit)
                        .padding(.top, 120)
                        .padding(.horizontal, 40)
                        .foregroundColor(Color(hex:0xEFEEEB))
                    
                    
                    
                }
            )
    }
    
}



struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
            .environmentObject(Emoji())
    }
}
