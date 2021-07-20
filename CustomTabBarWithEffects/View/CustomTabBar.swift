//
//  CustomTabBar.swift
//  CustomTabBarWithEffects
//
//  Created by Alexander Bonney on 7/19/21.
//

import SwiftUI

struct CustomTabBar: View {
    
    @StateObject var tabData = TabViewModel()
    
    //hiding tab view
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @Namespace var animation
    
    var body: some View {
        TabView(selection: $tabData.currentTab) {
            Home(animation: animation)
                .environmentObject(tabData)
                .tag("Home")
            
            Text("Purchased")
                .tag("Purchased")
            
            Text("Settings")
                .tag("Settings")
        }
        //showing custom tab view
        .overlay (
            HStack {
                TabBarButton(title: "Home", image: "house", animation: animation)
//                TabBarButton(title: "Purchased", image: "cart", animation: animation)
                TabBarButton(title: "Settings", image: "gearshape", animation: animation)

        }.environmentObject(tabData)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(.thinMaterial, in: Capsule())
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
                .shadow(color: .black.opacity(0.09), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.09), radius: 5, x: -5, y: 0)
            
            //hiding tab bar
                .offset(y: tabData.showingDetails ? 250 : 0)
            
            // always light tab bar
                .colorScheme(.light)
            
        ,alignment: .bottom
        )
        
        //showing custom details view
        .overlay(
            
            DetailView(animation: animation).environmentObject(tabData)
        )
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

//TabBarButton

struct TabBarButton: View {
    @EnvironmentObject var tabData: TabViewModel
    
    var title: String
    var image: String
    
    //slide animation
    var animation: Namespace.ID
    
    var body: some View {
        Button {
            withAnimation() {
                tabData.currentTab = title
            }
        } label: {
            VStack {
                Image(systemName: image)
                    .font(.title2)
                //setting same height for all images to avoid animation glitch
                    .frame(height: 18)
                
                Text(title).font(.caption.bold())
            }.foregroundColor(tabData.currentTab == title ? Color("Tab") : .secondary)
                .frame(maxWidth: .infinity).overlay(
                ZStack {
                //showing only for current tab
                if tabData.currentTab == title {
                    TabIndicator().fill(LinearGradient(gradient: .init(colors: [
                        Color("Tab").opacity(0.2),
                        Color("Tab").opacity(0.1),
                        .clear
                    ]), startPoint: .top, endPoint: .bottom))
                    //Geometry effect
                        .matchedGeometryEffect(id: "TAB", in: animation)
                        .padding(.top, -10 )
                        .padding(.horizontal, 8)
                }
            }
            )
        }
    }
}

// Custom Tab Lighting indicator
// Shape

struct TabIndicator: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width - 10, y: rect.height))
            path.addLine(to: CGPoint(x: 10, y: rect.height ))
        }
    }
}
