//
//  ThemeModal.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI
import GoogleMobileAds

struct ThemeModal: View {
    var body: some View {
        ScrollView{
            VStack{ Image("Theme")
                    .padding(.top, 24)
                VStack{
                    Text("Theme")
                        .padding(.bottom, 24)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("The theme in a story is the main message or idea that the author wants to convey to the readers. It's like a lesson or a moral that can be drawn from the story.")
                        .padding(.bottom, 24)
                    
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        Spacer()
                    }.padding(.bottom, 24)
                    
                    Text("It helps to make sense of the story and to make us think about what is important in life. For example, the theme of a story could be the importance of friendship or the strength of love.")
                        .padding(.bottom, 24)
                    
                    HStack {
                        Spacer()
                        GADBannerViewController()
                            .frame(width: GADAdSizeBanner.size.width, height: GADAdSizeBanner.size.height)
                        Spacer()
                    }.padding(.bottom, 24)
                    
                    Text("The theme is important because it helps us to understand the author's message and gives us.")
                        .padding(.bottom, 24)
                    Spacer()
                }.padding(.horizontal, 24)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct ThemeModal_Previews: PreviewProvider {
    static var previews: some View {
        ThemeModal()
    }
}
