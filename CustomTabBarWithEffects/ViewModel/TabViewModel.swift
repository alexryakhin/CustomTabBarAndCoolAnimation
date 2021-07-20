//
//  TabViewModel.swift
//  CustomTabBarWithEffects
//
//  Created by Alexander Bonney on 7/19/21.
//

import SwiftUI

class TabViewModel: ObservableObject {
    
    @Published var currentTab = "Home"
    
    //details data
    
    @Published var currentCard: Card?
    @Published var showingDetails: Bool = false
    
    
}
