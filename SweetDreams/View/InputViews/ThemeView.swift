//
//  View3.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds
struct ThemeView: View {
    let nextAction: () -> Void
    @EnvironmentObject var userData: UserData
    let screenRect = UIScreen.main.bounds
    let currentIndex = 2
    @State var isPresented = false
    
    var body: some View {
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        GeometryReader { geometry in
            
            ZStack {
                Image("bg").frame(width: screenWidth, height: screenHeight)
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Theme") .font(.system(size: 68)).foregroundColor(.white).bold().padding(.top, 24)
                            Text("What's the story about").font(.system(size: 28)).bold().foregroundColor(.white).padding(.bottom, 24)
                        }.padding(.horizontal, 24)
                        Spacer()
                    }
                        TextField("e.g. magic, fantasy, love", text: $userData.theme)
                            .modifier(CustomTextfield())
                            .padding(.horizontal, 24)
                            .onSubmit {
                                print(userData.hero)
                            }
                            .overlay(
                                HStack{
                                    Spacer()
                                    Image(systemName: "info.circle")
                                        .colorScheme(.light)
                                        .font(.system(size: 24))
                                        .foregroundColor(.black)
                                        .background(Color.white)
                                        .onTapGesture {
                                            isPresented = true
                                        }
                                }.padding(.horizontal, 39) )
                    Image("Theme")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(44)
                    ProgressBarView(currentIndex: currentIndex, numberOfScreens: 4).padding(.horizontal, 130)
                    Button("Next") {
                        nextAction()
                    }.buttonStyle(BigButtonStyle()).padding(24)
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        Spacer()
                    }
                }.frame(height: geometry.size.height) // <- Set the height of the VStack to be the same as the screen height
            }.ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
        }.sheet(isPresented: $isPresented) {
            ThemeModal()
        }
    }
}


struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(nextAction: {
            withAnimation {
            }
        }).environmentObject(UserData())
    }
}

