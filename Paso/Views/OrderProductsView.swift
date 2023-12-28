//
//  OrderProductsView.swift
//  Paso
//
//  Created by Leonardo on 27/12/23.
//

import SwiftUI

struct OrderProductsView: View {
    let products: [Product]
    let columns = [GridItem(), GridItem(), GridItem(), GridItem()]
    @State var a = Category()
    var body: some View {
        ScrollView {
            TextField("", text: $a.name)
            LazyVGrid(columns: columns) {
                ForEach(products, id: \.self) { product in
                    OrderProductView(action: {}, product: product)
                }
            }
        }
    }
    
    private func emoji(_ value: Int) -> String {
        guard let scalar = UnicodeScalar(value) else { return "?" }
        return String(Character(scalar))
    }
}

#Preview {
    ContentView()
}

struct OrderProductView: View {
    let action: () -> Void
    let product: Product
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(product.name).padding(.leading, 15)
                Spacer()
            }
            Spacer()
            Color(.blueGreen).frame(height: 10)
        }
        .frame(height: 80)
        .frame(maxWidth: .infinity)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(10)
        .shadow(color: .black.opacity(0.6), radius: 5, x: 4, y: 4)
    }
}
