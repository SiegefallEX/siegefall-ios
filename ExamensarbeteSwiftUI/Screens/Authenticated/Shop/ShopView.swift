//
//  ShopView.swift
//  ExamensarbeteSwiftUI
//
//  Created by Michihide Sugito on 2025-05-03.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var apiAuthManager: ApiAuthManager
    @EnvironmentObject var userManager: UserManager
    
    let width: CGFloat = UIScreen.main.bounds.width
    let height: CGFloat = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            BackgroundMain()
            TopNavBar()
            
            VStack {
                Spacer()
                
                HStack {
                    ButtonBig(function: {
                        navigationManager.navigateTo(screen: .home)
                    }, text: "Back").offset(x: width * TouhouSiegeStyle.Decimals.medium, y: -width * TouhouSiegeStyle.Decimals.xSmall)
                    
                    Spacer()
                }
            }
        }
    }
}
