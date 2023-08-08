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
               Text("Tab 2")
                   .tabItem {
                       Image(systemName: "magnifyingglass")
                       Text("Search")
                   }
                   .tag(1)

               // Tab 3
               Text("Tab 3")
                   .tabItem {
                       Image(systemName: "person")
                       Text("Profile")
                   }
                   .tag(2)
           }
           .accentColor(Color("color"))
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
