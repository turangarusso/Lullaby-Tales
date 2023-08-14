//
//  AntiHeroModal.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds

struct AntiHeroModal: View {
    var body: some View {
        ScrollView{
            VStack{
                
                Image("AntiHero")
                    .padding(.top, 24)
                
                VStack{
                    
                    Text("Anti-Hero")
                        .padding(.bottom, 24)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Article before the name: use A/AN if the name is indeterminate, use THE if the name is intended as a proper noun.")
                        .padding(.bottom, 24)
                    
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        Spacer()
                    }.padding(.bottom, 24)
                    
                    Text("Using a capital letter at the beginning of the name will make it a proper noun (e.g. There was a dragon vs. There was a evil dragon).")
                        .padding(.bottom, 24)
                    
                    Text("You can build the character's name using adjectives to give them personality followed by their name (e.g. The good witch Brillantina).")
                        .padding(.bottom, 24)
                    
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        Spacer()
                    }.padding(.bottom, 24)
                    
                    Spacer()
                    
                }.padding(.horizontal, 24)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct AntiHeroModal_Previews: PreviewProvider {
    static var previews: some View {
        AntiHeroModal()
    }
}
