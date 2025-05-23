//
//  PlayGameView.swift
//  ExamensarbeteSwiftUI
//
//  Created by Michihide Sugito on 2025-05-20.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var apiAuthManager: ApiAuthManager
    @EnvironmentObject var userManager: UserManager
    
    let width: CGFloat = UIScreen.main.bounds.width
    let height: CGFloat = UIScreen.main.bounds.height
    
    @State var isDefenseSet: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundMain()
            TopNavBar()
            
            VStack {
                ButtonBig(function: {
                    navigationManager.navigateTo(screen: .game(isComputerPlaying: true))
                }, text: "Player vs Computer").offset(x: -width * 0.25)
                    .disabled(!isDefenseSet)
                    .opacity(isDefenseSet ? 1 : 0.5)
                
                ButtonBig(function: {
                    navigationManager.navigateTo(screen: .game(isComputerPlaying: false))
                }, text: "Player vs Player").offset(x: -width * 0.22)
                    .disabled(!isDefenseSet)
                    .opacity(isDefenseSet ? 1 : 0.5)
                
                ButtonBig(function: {
                }, text: "Colosseum").offset(x: -width * 0.22)
                    .disabled(true)
                    .opacity(0.5)
                
                ButtonBig(function: {
                    navigationManager.navigateTo(screen: .defense)
                }, text: "Defense").offset(x: -width * 0.25)
                
                ButtonBig(function: {
                    navigationManager.navigateTo(screen: .home)
                }, text: "Back").offset(x: -width * 0.28)
            }.offset(y: width * TouhouSiegeStyle.Decimals.xSmall)
        }.task {
            if apiAuthManager.token != nil && apiAuthManager.username != nil {
                do {
                    try await userManager.getUser()
                    
                    if let user = userManager.user {
                        isDefenseSet = !user.defense.isEmpty
                    }
                } catch let error {
                    print("Error loading user: \(error)")
                    apiAuthManager.token = nil
                    apiAuthManager.username = nil
                    userManager.user = nil
                    navigationManager.navigateTo(screen: .landing)
                }
            } else {
                apiAuthManager.token = nil
                apiAuthManager.username = nil
                userManager.user = nil
                navigationManager.navigateTo(screen: .landing)
            }
        }
    }
}

#Preview {
    PlayView()
        .environmentObject(NavigationManager())
        .environmentObject(UserManager(apiAuthManager: ApiAuthManager()))
        .environmentObject(ApiAuthManager())
}

