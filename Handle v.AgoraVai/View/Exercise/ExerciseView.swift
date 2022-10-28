//
//  ExerciseView.swift
//  Holdy v2
//
//  Created by Alexandre César Brandão de Andrade on 25/10/22.
//

import SwiftUI



struct ExerciseView: View {
    //    @StateObject var sharedVM: SharedViewModel = SharedViewModel()

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero

    @Environment(\.dismiss) var dismiss
    @Binding var currentExercise: Exercise

    var body: some View {
        //        NavigationView{
        ZStack{
            Color(hex:0xEED294)


            Image("PreviewExercise2")
                .resizable()
                .scaledToFit()
                .navigationBarBackButtonHidden(false)
                .navigationBarItems(leading:
                Button(action : {
                    currentExercise = .none
                }){
//                    Image(systemName: "arrow.left")
//                        .foregroundColor(Color.black)
                })


            NavigationLink {
                StartedExercise()
                    .toolbar(.hidden)
                    .ignoresSafeArea()
            } label: {
                Group{
                    Text("OK")
                        .scaledFont(name: "Montserrat-Bold", size: 24)
                        .foregroundColor(Color(hex: 0x265150))
                }
                .padding(.leading, 600)
                .padding(.bottom, 300)
            }


        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation") // Forcing the rotation to portrait
            AppDelegate.orientationLock = .landscapeLeft // And making sure it stays that way
        }
        .onDisappear {
            AppDelegate.orientationLock = .landscapeLeft // Unlocking the rotation when leaving the view
        }
        .ignoresSafeArea()
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in

            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }

        }))

        //        }
        
    }
}

struct DummyView4: View{
    @State var currentExercise = Exercise.expand
    var body: some View{
        ExerciseView(currentExercise: $currentExercise)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        DummyView4()
    }
}

