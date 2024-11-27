//
//  RecipeRow.swift
//  SwiftUINetworking
//
//  Created by Guanglei Liu on 11/27/24.
//

import SwiftUI

struct RecipeRow: View {

    @State var receipt: Recipe

    var body: some View {
        HStack {
            if let photoURL = URL(string: receipt.photoURL) {
                AsyncImage(url: photoURL) { image in
                    image
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(.rect(cornerRadius: 8))
                } placeholder: {
                    Image(systemName: "fork.knife")
                }
            }

            VStack(alignment: .leading) {
                Text(receipt.name)
                    .font(.headline)
                Text(receipt.cuisine)
            }
        }
    }
}

//#Preview {
//    RecipeRow(receipt: <#Recipe#>)
//}
