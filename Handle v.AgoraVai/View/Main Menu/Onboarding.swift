//
//  Onboarding.swift
//  Holdy v2
//
//  Created by Vivian Bacelar on 21/10/22.
//


import SwiftUI


struct Onboarding: View {

    @State var index: Int = 0
    @State var mostrandoCapa:Bool = true
    @State var yOffSet:CGFloat = 0
    @State var shownText:String = ""

    var info: OnboardingInfo {
        return OnboardingInfo.all[index]
    }

    var isLast: Bool {
        return (index == OnboardingInfo.all.count - 1)
    }

    var body: some View {
        GeometryReader {geometry in
            ZStack{


                Color(hex: 0xF2F1EE)
                    .ignoresSafeArea()

                VStack{

                    Color(info.color)
                        .ignoresSafeArea()
                        .overlay {
                            Image(info.imageName)
                                .resizable()
                                .frame(width: 357, height: 366.27)
                                .aspectRatio(1, contentMode: .fit)
                                .scaledToFit()
                                .ignoresSafeArea()
                                .padding()
                            //                                .shadow(color: Color(hex: 0xD9D9D9), radius: 4, x: 0, y: 8)
                        }


                    VStack(alignment: .leading, spacing: 16) {
                        Text(info.title)
                            .foregroundColor(Color(info.color))
                            .font(.custom("Montserrat-Bold", size: 32))
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text(info.synopsis)
                            .foregroundColor(Color("Marinho"))
                            .font(.custom("Montserrat-Regular", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 42)
                    .padding(.bottom, 20)


                    HStack {
                        Image(info.progressImage)
                            .resizable()
                            .aspectRatio(5, contentMode: .fit)
//                            .frame(width: 92,height:94)
                            .padding(.top, 20)
                            .padding(.horizontal, 50)
                            .clipped()
                            .scaledToFit()


                        Spacer()

                        if isLast == false {
                            Button {
                                self.index += 1
                            } label: {
                                Text("Next")
                                    .foregroundColor(Color("Marinho"))
                                    .bold()
                                    .fontWeight(.light)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        } else {
                            NavigationLink{
                                Onboarding3()
                            } label: {
                                Text("Let’s Begin!")
                                    .foregroundColor(Color("Marinho"))
                                    .bold()
                                    .fontWeight(.light)
                                    .padding(.trailing)
                            }
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 14)
                }
                if(mostrandoCapa){
                    Begin().ignoresSafeArea()
                        .offset(y:yOffSet)
                        .animation(.easeIn(duration: 3), value: yOffSet)

                }


            }
            .overlay(alignment: .topTrailing) {

                if isLast == false {
                    NavigationLink {
                        Onboarding3()
                    } label: {
                        Text(shownText)
                            .font(.custom("Montserrat-Bold", size: 15))
                            .foregroundColor(.white)
                        //                    } else {
                        //                        isLast == true
                        //                        }

                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                }

            }

            .onAppear{
                yOffSet = -geometry.size.height*2
                                    Task{
                                        try await Task.sleep(nanoseconds: 1_000_000_000)
                                        try await Task.sleep(nanoseconds: 1_000_000_000)
                                        try await Task.sleep(nanoseconds: 1_000_000_000)
                                        shownText = "Skip"
                                        mostrandoCapa.toggle()
                                    }
            }


        }

    }
}



struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
