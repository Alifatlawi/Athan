//
//  TabBar.swift
//  Athan
//
//  Created by eyh.mac on 7.08.2023.
//

import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 0

       var body: some View {
           TabView(selection: $selectedTab) {
               // Tab 1
               AthanHome()
                   .tabItem {
                       Image(systemName: "clock.badge.fill")
                       Text("Athan Time")
                   }
                   .tag(0)

               // Tab 2
               testView()
                   .tabItem {
                       Image(systemName: "gear")
                       Text("Settings")
                   }
                   .tag(1)
           }
           .accentColor(Color("color"))
    }
}

#Preview {
    TabBar()
}
