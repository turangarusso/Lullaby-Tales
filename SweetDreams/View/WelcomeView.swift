//
//  WelcomeView.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds

struct WelcomeView: View {
    private var fullScreenAd: Interstitial?
    init() {
        fullScreenAd = Interstitial()
    }
    
    let screenRect = UIScreen.main.bounds
    var body: some View {
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        NavigationView{
            ZStack {
                //BannerView()

                Image("bg").frame(width: screenWidth, height: screenHeight)
                VStack {
                    HStack(){
                        VStack(alignment: .leading){
                            Text("Welcome")
                                .font(.system(size: 66))
                                .foregroundColor(.white)
                                .padding(.top, 64)
                                .bold()
                            Text("Hi, I'm Brillantina. Let's create our story")
                                .font(.system(size: 24))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.bottom, 24)
                        }
                        .padding(.horizontal, 24)
                        Spacer()
                    }
                    Image("brillatraspa")
                        .scaledToFit()
                        .aspectRatio(1, contentMode: .fit)
                        .padding(44)
                        .onTapGesture {
                            self.fullScreenAd?.showAd()

                        }
                    NavigationLink(destination: NavigatorView()) {
                        Text("New Story")
                    }.buttonStyle(BigButtonStyle()).padding(24)
                        
                    NavigationLink(destination: ArchiveView()) {
                        Text("Library")
                    }.buttonStyle(MiddleButtonStyle())
                        .padding(24)
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        Spacer()
                    }
                }
            }.navigationTitle("Welcome").navigationBarHidden(true)
                .ignoresSafeArea()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
