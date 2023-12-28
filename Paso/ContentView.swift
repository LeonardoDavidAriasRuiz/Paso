//
//  ContentView.swift
//  Paso
//
//  Created by Leonardo on 26/12/23.
//

import SwiftUI
import CloudKit

struct ContentView: View {
    var body: some View {
        ZStack {
//            Color(.background).ignoresSafeArea()
            LinearGradient(colors: [Color(.blue), Color(.blueGreen), Color(.green)], startPoint: .bottomLeading, endPoint: .top).ignoresSafeArea()
            HStack {
                OrderProductsView(products: [Product(),Product(),Product(),Product(),Product(),Product()])
            }
        }
    }
}

#Preview {
    ContentView()
}
