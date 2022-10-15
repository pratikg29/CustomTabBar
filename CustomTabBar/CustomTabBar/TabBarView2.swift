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
                .frame(height: 90, alignment: .center)
                .clipped()
        }
        .frame(height: 90, alignment: .center)
        .padding(.horizontal, 30)
    }
    
    @ViewBuilder private var backgroundView: some View {
        LinearGradient(colors: [.init(white: 0.9), .white], startPoint: .top, endPoint: .bottom)
            .mask {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(lineWidth: 6)
            }
            .shadow(color: .black.opacity(0.5), radius: 5, x: 0, y: 8)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
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
                    .frame(width: 55, height: 55, alignment: .center)
                
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
                withAnimation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6)) {
                    selectedTab = tab
                }
            } label: {
                ZStack {
                    if isSelected {
//                        Circle()
                        RoundedRectangle(cornerRadius: 13, style: .continuous)
//                            .fill(
//                                LinearGradient(colors: [.white, .init(white: 0.6)], startPoint: .topLeading, endPoint: .bottomTrailing)
//                            )
//                            .shadow(color: .white, radius: 10, x: -7, y: -7)
//                            .shadow(color: .init(white: 0.6), radius: 10, x: 7, y: 7)
//                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                        
                            .fill(
                                Color.white
                            )
                            .overlay(content: {
                                LinearGradient(colors: [.white.opacity(0.0001), tab.color.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .clipShape(RoundedRectangle(cornerRadius: 13, style: .continuous))
                            })
                            .shadow(color: .white, radius: 10, x: -7, y: -7)
                            .shadow(color: tab.color.opacity(0.7), radius: 10, x: 8, y: 8)
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(isSelected ? tab.color : .gray)
                        .scaleEffect(isSelected ? 1 : 0.9)
//                        .shadow(color: isSelected ? tab.color.opacity(0.5) : .clear, radius: 5, x: 0, y: 0)
                        .animation(isSelected ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                }
            }
//            .buttonStyle(.plain)
        }
        
        private var isSelected: Bool {
            selectedTab == tab
        }
    }
}

struct TabBarView2_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView2()
    }
}
