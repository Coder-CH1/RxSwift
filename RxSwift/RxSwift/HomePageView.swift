//
//  HomeView.swift
//  RxSwift
//
//  Created by Mac on 17/10/2023.
//

import SwiftUI

struct HomePageView: View {
    @State var presentSidemenu = false
    var body: some View {
        ZStack {
            if presentSidemenu {
                SideMenuView(presentSidemenu: $presentSidemenu)
                    .transition(.move(edge: .leading))
                    .animation(.default)
            }
            Button(action: {
                withAnimation {
                    presentSidemenu.toggle()
                }
            }) {
                Image(systemName: "text.alignleft")
                    .foregroundColor(.blue)
                    .font(.title)
            }
            .padding()
            .position(x: 30, y: 30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

struct SideMenuView: View {
    @Binding var presentSidemenu: Bool

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Color.clear
                HStack {
                    MenuContents(presentSidemenu: $presentSidemenu)
                        .foregroundColor(.red)
                        .padding()
                }
                .frame(width: 250)
                .background(Color.blue)
            }
            .gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -100 {
                            withAnimation {
                                presentSidemenu = false
                            }
                        }
                    }
            )
            .frame(width: geometry.size.width)
        }
    }
}

struct MenuContents: View {
    @Binding var presentSidemenu: Bool

    var body: some View {
        List {
            NavigationLink("Profile", destination: Text("Profile"))
            NavigationLink("Orders", destination: Text("Orders"))
            NavigationLink("Offer and Promo", destination: Text("Offer and Promo"))
            NavigationLink("Privacy policy", destination: Text("Privacy policy"))
            NavigationLink("Security", destination: Text("Security"))
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    withAnimation {
                        presentSidemenu.toggle()
                    }
                }) {
                    Image(systemName: "text.alignleft")
                }
            }
        }
    }
}