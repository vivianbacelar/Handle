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

    @State var showExercise: Bool = false

    var body: some View {
        ZStack{
            Color(hex:0xEED294)


            Image("PreviewExercise2")
                .resizable()
                .scaledToFit()
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading:
                Button(action : {
                    currentExercise = .none
                }){
//                    Image(systemName: "arrow.left")
//                        .foregroundColor(Color.black)
                })


            Button {
                showExercise = true
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
        .ignoresSafeArea()
        .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in

            if(value.startLocation.x < 20 && value.translation.width > 100) {
                self.mode.wrappedValue.dismiss()
            }

        }))
        .navigationBarHidden(true)


        .fullScreenCover(isPresented: self.$showExercise) {
                StartedExercise()
                    .toolbar(.hidden)
                    .ignoresSafeArea()
        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation") // Forcing the rotation to portrait
            AppDelegate.orientationLock = .landscapeLeft // And making sure it stays that way
        }
        .onDisappear {
            AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
        }

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

