import SwiftUI

struct About: View {
    
    @State var nomeDaImagem: String = "psicologia.png"
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color(hex: 0xF2F1EE)
                    .ignoresSafeArea()
                
                
                ScrollView {
                    
                    VStack{
                        Spacer()
                        
                        Text("About the app")
                            .scaledFont(name: "Montserrat-Light", size: 32)
                            .foregroundColor(Color(hex: 0x265150))
                            .padding(.trailing,140)
                        
                        
        
                        VStack {
                            
                            Text("Professionally Tested")
                                .font(.custom("Montserrat-SemiBold", size: 22))
                                .foregroundColor(Color(hex: 0x5AA091))
                                .multilineTextAlignment(.trailing)
                            
                                .padding(.leading)
                            
                           HStack (alignment: .top){
                          
                                Image("Image")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
//                                    .padding(.trailing)
                           
                                Spacer()
                                
                                Text("Handle is an app designed to help you understand and get a better hold of your stress. All exercises in [name] are brought to you by the Formative Psychology Center, tested and used by professionals on a daily basis. ")
                                    .font(.custom("Inter-Thin-BETA", size: 14))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.trailing)
                                  
                                    .padding(.leading, 40)
                                
                            
                            }
                            .frame(maxWidth: .infinity)
//                            .background(.yellow)
                        }
                        .padding(.top, 20)
//                        .background(.green)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 60)
//                        .background(.blue)
                        
                        Spacer()
                
                        .padding(10)
                            
                            VStack(alignment: .leading) {
                                Text("Where it comes from")
                                    .font(.custom("Montserrat-SemiBold", size: 22))
                                    .foregroundColor(Color(hex: 0x5AA091))
                                    .multilineTextAlignment(.leading)
    //                                .background(.red)
                                    .padding(.leading, 10)
                                
                                HStack (alignment: .top){
                              
                                Text("The Formative Psychology Center was founded in 1970 by Stanley Keleman. This branch of psychology that studies ways on how the body affects our mental state. And specifically, how we can voluntarily destress by changing our body posture and behaviour. ")
                                    .font(.custom("Inter-Thin-BETA", size: 14))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                                  .padding(.leading, 10)
                                    
                               
                                    Spacer()
                                    
                                    
                                    Image("Stanley")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .scaledToFit()
//                                        .padding(.leading)
                                    
                                
                                }
                                .frame(maxWidth: .infinity)
    //                            .background(.yellow)
                            }
                            .padding(.top, 20)
    //                        .background(.green)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 55)
    //                        .background(.blue)
                        
                        
                        
                        Spacer()
                        
//                        VStack (alignment: .center, spacing: ){
                            
                        .padding(5)
                        
                        VStack(alignment: .center) {
                            Text("From the team")
                                .font(.custom("Montserrat-SemiBold", size: 22))
                                .foregroundColor(Color(hex: 0x5AA091))
//                                .background(.red)
                                
                           
                                
                                HStack{
                                
                                Image("Alexandre")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .scaledToFit()
                                    .padding(.leading)
                                
                                    Image("Flora")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .scaledToFit()
                                        .padding(.leading)
                                    
                                    Image("Lara")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .scaledToFit()
                                        .padding(.leading)
                                    
                                    Image("Vivian")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                        .scaledToFit()
                                        .padding(.leading)
                               
                            
                                }.padding(20)
                                
                                
                                Text("Handle is a project developed by Alexandre, Flora, Lara and Vivian, four students who were motivated to find new ways to handle stress. The app was developed in the Apple Developer Academy Program PUC-Rio.")
                                .font(.custom("Inter-Thin-BETA", size: 14))
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal, 45)
                                
                            .frame(maxWidth: .infinity)
//                            .background(.yellow)
                        }
                        .padding(.top, 20)
//                        .background(.green)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
//                        .background(.blue)
                    
                            
                            
                           
                        
                        
            
                                
                            }
                        }
                    }
            .hiddenTabBar()
                    
                }
                        
                        
                        
                        
                        
//                        .navigationTitle("About the app")
                    }
//                    .navigationBarHidden(false)
                    
                    
                    
                }
                
            
            
            //
            //        class Theme {
            //            static func navigationBarColors(background : UIColor?,
            //                                            titleColor : UIColor? = nil, tintColor : UIColor? = nil ){
            //
            //                let navigationAppearance = UINavigationBarAppearance()
            //                navigationAppearance.configureWithOpaqueBackground()
            //                navigationAppearance.backgroundColor = background ?? .clear
            //
            //                navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
            //                navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
            //
            //                UINavigationBar.appearance().standardAppearance = navigationAppearance
            //                UINavigationBar.appearance().compactAppearance = navigationAppearance
            //                UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
            //
            //                UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
            //            }
            //        }
        
        struct About_Previews: PreviewProvider {
            static var previews: some View {
                About()
            }
        }


