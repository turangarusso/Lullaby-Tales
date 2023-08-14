//
//  InputView.swift
//  OpenAI
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds
struct SummaryView: View {
    var fullScreenAd: Interstitial = Interstitial()

    @EnvironmentObject var userData: UserData
    let screenRect = UIScreen.main.bounds
    let currentIndex = 3
    let performAction: () -> Void
    var body: some View {
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        GeometryReader { geometry in
            ZStack {
                Image("bg").frame(width: screenWidth, height: screenHeight)
                VStack {
                    HStack{
                        VStack(alignment: .leading){
                            Text("Summary")
                                .font(.system(size: 72))
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top, 48)
                            Text("Let's mix everything")
                                .font(.system(size: 28))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 24)
                        }.padding(.horizontal, 24)
                        
                        Spacer()
                    }
                    VStack{
                        TextField("Hero", text: $userData.hero).modifier(CustomTextfield())
                        TextField("Anti-hero", text: $userData.antihero).modifier(CustomTextfield())
                            .padding(.top, 24)
                        TextField("Theme", text: $userData.theme).modifier(CustomTextfield())
                            .padding(.top, 24)
                            .padding(.bottom, 48)
                    }.padding(24)
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        Spacer()
                    }
                    ProgressBarView(currentIndex: currentIndex, numberOfScreens: 4)
                        .padding(.horizontal, 130)
                        .padding(.top, 24)
                    Button("Create") {
                        performAction()
                        self.fullScreenAd.showAd()

                    }.buttonStyle(BigButtonStyle()).padding(.bottom, 48).padding(.top, 24)
                   
                }
                .frame(height: geometry.size.height) // <- Set the height of the VStack to be the same as the screen height
            }.ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
        }
        
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(performAction: {}).environmentObject(UserData())
    }
}
