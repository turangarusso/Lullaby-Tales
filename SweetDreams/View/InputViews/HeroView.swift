//
//  View1.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds

struct HeroView: View {
    let nextAction: () -> Void
    @EnvironmentObject var userData: UserData
    let screenRect = UIScreen.main.bounds
    let currentIndex = 0
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
                            Text("Hero")
                                .font(.system(size: 68))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 24)
                            Text("Who's your protagonist")
                                .font(.system(size: 28))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 24)
                        }.padding(.horizontal, 24)
                        Spacer()
                    }
                    TextField("e.g. Brillantina the good witch", text: $userData.hero)
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
                    Image("Hero")
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
            HeroModal()
        }
    }
}



struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(nextAction: {
            withAnimation {
            }
        }).environmentObject(UserData())
    }
}

