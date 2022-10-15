//
//  TabBarView1.swift
//  CustomTabBar
//
//  Created by Pratik on 14/10/22.
//

import SwiftUI

struct TabBarView1: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.white)
                .shadow(color: .gray.opacity(0.4), radius: 20, x: 0, y: 20)
            
            TabsLayoutView()
        }
        .frame(height: 70, alignment: .center)
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
                    .frame(width: 65, height: 65, alignment: .center)
                
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
                            .shadow(radius: 10)
                            .background {
                                Circle()
                                    .stroke(lineWidth: 15)
                                    .foregroundColor(backgroundColor)
                            }
                            .offset(y: -40)
                            .matchedGeometryEffect(id: "Selected Tab", in: namespace)
                            .animation(.spring(), value: selectedTab)
                    }
                    
                    Image(systemName: tab.icon)
                        .font(.system(size: 23, weight: .semibold, design: .rounded))
                        .foregroundColor(selectedTab == tab ? .init(white: 0.9) : .gray)
                        .scaleEffect(selectedTab == tab ? 1 : 0.8)
                        .offset(y: selectedTab == tab ? -40 : 0)
                        .animation(selectedTab == tab ? .spring(response: 0.5, dampingFraction: 0.3, blendDuration: 1) : .spring(), value: selectedTab)
                }
            }
            .buttonStyle(.plain)
        }
    }
}


struct TabBarView1_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView1()
            .padding(.horizontal)
    }
}
