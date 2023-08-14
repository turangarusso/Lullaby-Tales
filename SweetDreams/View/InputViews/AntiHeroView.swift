//
//  View2.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds
struct AntiHeroView: View {
    var fullScreenAd: Interstitial = Interstitial()
   
    let backAction: () -> Void
    let nextAction: () -> Void
    @EnvironmentObject var userData: UserData
    let screenRect = UIScreen.main.bounds
    let currentIndex = 1
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
                            Text("Anti-Hero") .font(.system(size: 68)).foregroundColor(.white).bold().padding(.top, 24)
                            Text("Who's the other character").font(.system(size: 28)).bold().foregroundColor(.white).padding(.bottom, 24)
                        }.padding(.horizontal, 24)
                        Spacer()
                    }
                    
                    TextField("Smaug the evil dragon", text: $userData.antihero)
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
                    Image("AntiHero")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(44)
                    ProgressBarView(currentIndex: currentIndex, numberOfScreens: 4).padding(.horizontal, 130)
                    Button("Next") {
                        nextAction()
                        self.fullScreenAd.showAd()
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
                    self.fullScreenAd.showAd()

                    hideKeyboard()
                }
        }.sheet(isPresented: $isPresented) {
            AntiHeroModal()
        }
    }
}


struct AntiHeroView_Previews: PreviewProvider {
    static var previews: some View {
        AntiHeroView(backAction: {
            withAnimation {
                
            }
        }, nextAction: {
            withAnimation {
                
            }
        }).environmentObject(UserData())
    }
}

