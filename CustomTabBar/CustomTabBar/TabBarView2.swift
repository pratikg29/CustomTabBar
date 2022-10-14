//
//  TabBarView2.swift
//  CustomTabBar
//
//  Created by Pratik on 14/10/22.
//

import SwiftUI

struct TabBarView2: View {
    let bgColor: Color = .init(white: 0.9)
    
    var body: some View {
        ZStack {
            backgroundView
            
            TabsLayoutView()
        }
        .frame(height: 70, alignment: .center)
        .padding(.horizontal, 30)
    }
    
    @ViewBuilder private var backgroundView: some View {
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(LinearGradient(colors: [.init(white: 0.9), .white], startPoint: .topLeading, endPoint: .bottomTrailing))
            .overlay {
                LinearGradient(colors: [.init(white: 0.85), .init(white: 0.93)], startPoint: .topLeading, endPoint: .trailing)
                    .mask {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(lineWidth: 3)
//                            .blur(radius: 2)
                    }
            }
            .shadow(color: .white, radius: 10, x: -20, y: -20)
            .shadow(color: .init(white: 0.9), radius: 10, x: 20, y: 20)
    }
}

fileprivate struct TabsLayoutView: View {
    @State var selectedTab: Tab = .home
    @Namespace var namespace
    
    var body: some View {
        HStack {
            Spacer(minLength: 0)
            
            ForEach(Tab.allCases) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
                    .frame(width: 50, height: 50, alignment: .center)
                
                Spacer(minLength: 0)
            }
        }
    }
    
    
    
    private struct TabButton: View {
        let tab: Tab
        @Binding var selectedTab: Tab
        var namespace: Namespace.ID
        
        var body: some View {
            Button {
                withAnimation {
                    selectedTab = tab
                }
            } label: {
                ZStack {
                    if selectedTab == tab {
                        Circle()
                            .fill(
                                LinearGradient(colors: [.white, .init(white: 0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .shadow(color: .white, radius: 10, x: -10, y: -10)
                            .shadow(color: .init(white: 0.7), radius: 10, x: 10, y: 10)
//                            .overlay(content: {
//                                Circle()
//                                    .fill(
//                                        LinearGradient(colors: [.white, .init(white: 0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
//                                    )
//                            })
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                            .animation(.spring(), value: selectedTab)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(selectedTab == tab ? .gray : .gray)
                        .animation(selectedTab == tab ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                }
            }
            .buttonStyle(.plain)
        }
    }
}

struct TabBarView2_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView2()
    }
}
