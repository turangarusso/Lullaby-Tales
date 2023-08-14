//
//  NavigatorView.swift
//  SweetDreams
//
//  Created by Ac Analytics.
//

import SwiftUI

struct NavigatorView: View {
    @State private var currentIndex = 0
    @StateObject var userData = UserData()
    
    var body: some View {
        VStack {
            switch currentIndex {
            case 0:
                HeroView(nextAction: {
                    withAnimation {
                        currentIndex += 1
                    }
                })
            case 1:
                AntiHeroView(backAction: {
                    withAnimation {
                        currentIndex -= 1
                    }
                }, nextAction: {
                    withAnimation {
                        currentIndex += 1
                    }
                })
            case 2:
                ThemeView(nextAction: {
                    withAnimation {
                        currentIndex += 1
                    }
                })
            case 3:
                GenerateView()
            default:
                EmptyView()
            }
        }
        .environmentObject(userData)
        .gesture(
            DragGesture()
                .onEnded { value in
                    let horizontalDistance = value.translation.width
                    let verticalDistance = value.translation.height
                    if abs(horizontalDistance) > abs(verticalDistance) {
                        if horizontalDistance < 0 {
                            if currentIndex < 3 {
                                withAnimation {
                                    currentIndex += 1
                                }
                            }
                        } else if horizontalDistance > 0 {
                            if currentIndex > 0 {
                                withAnimation {
                                    currentIndex -= 1
                                }
                            }
                        }
                    }
                }
        )
        
    }
}

struct NavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigatorView().environmentObject(UserData())
    }
}
