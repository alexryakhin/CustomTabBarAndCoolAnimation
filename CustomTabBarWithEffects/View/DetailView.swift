//
//  DetailView.swift
//  CustomTabBarWithEffects
//
//  Created by Alexander Bonney on 7/19/21.
//

import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var tabData: TabViewModel
    var animation: Namespace.ID
    
    //showing data with delay
    @State var showData = false

    
    var body: some View {
        
        //safe unwrap card data
        if let card = tabData.currentCard, tabData.showingDetails {
            VStack(spacing: 0) {
                Image(card.image)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: card.id + "IMAGE", in: animation)
                    .padding().padding(.top, 25).padding()
                    .background(LinearGradient(
                        colors: [
                            Color("\(card.cardColor)1"),
                            Color("\(card.cardColor)2"),
                            Color("\(card.cardColor)3")
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                                    .cornerRadius(15)
                                    .matchedGeometryEffect(id: card.id + "BG", in: animation)
                                    .ignoresSafeArea()
                    )
                //close button
                    .overlay(
                        Button(action: {
                        withAnimation(.spring()) {
                            tabData.showingDetails = false
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding()
                            .background(.white, in: Circle())
                    })
                            .padding(.top, -5)
                            .padding(.trailing, 25)
                            .opacity(showData ? 1 : 0)
                        ,alignment: .topTrailing
                    )
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(card.title)
                            .font(.title2.bold())
                            .matchedGeometryEffect(id: "\(card.id)TITLE", in: animation)
                        
                        ForEach(faculties) { faculty in
                            HStack(spacing: 12) {
                                Image(systemName: faculty.image)
                                    .frame(width: 20, height: 20)
                                    .padding()
                                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 10))
                                    .shadow(radius: 2)
                                
                                
                                Text(faculty.name).fontWeight(.semibold)
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.title2)
                                    .foregroundColor(Color("C12"))
                            }
                            .padding(.vertical, 8)
                            .padding(.horizontal)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        }
                        .opacity(showData ? 1 : 0)
                    }
                    .padding()
                    .padding(.top)
                }
            }
            .background(.ultraThinMaterial)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    withAnimation() {
                        showData = true
                    }
                }
            }
            .onDisappear {
                withAnimation() {
                    showData = false
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
