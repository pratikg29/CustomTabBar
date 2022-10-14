//
//  TabBarView3.swift
//  CustomTabBar
//
//  Created by Pratik on 15/10/22.
//

import SwiftUI

struct TabBarView3: View {
    let bgColor: Color = .init(white: 0.9)
    
    var body: some View {
        TabsLayoutView()
            .padding()
            .background(
                Capsule()
                    .fill(.white)
            )
            .shadow(radius: 30)
    }
}

fileprivate struct TabsLayoutView: View {
    @State var selectedTab: Tab = .home
    @Namespace var namespace
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases) { tab in
                TabButton(tab: tab, selectedTab: $selectedTab, namespace: namespace)
//                    .frame(width: 65, height: 65, alignment: .center)
                
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
                HStack {
                    Image(systemName: tab.icon)
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(tab.color)
                        .opacity(selectedTab == tab ? 1 : 0.7)
//                        .frame(width: 35, height: 30)
//                        .animation(selectedTab == tab ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                    
                    if selectedTab == tab {
                        Text(tab.title)
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .foregroundColor(tab.color)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background {
                    if selectedTab == tab {
                        Capsule()
                            .fill(tab.color.opacity(0.3))
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                    }
                }
            }
            .buttonStyle(.plain)
        }
    }
}
struct TabBarView3_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView3()
            .frame(height: 70)
            .padding(.horizontal)
    }
}
