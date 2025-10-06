//
//  NailCardView.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import SwiftUI

struct NailCardView: View {
    let nail: NailEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let url = nail.photoURL, let img = UIImage(contentsOfFile: url.path) {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 200)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(.quaternary)
                        .frame(width: 160, height: 200)
                    Image(systemName: "camera.fill")
                        .imageScale(.large)
                        .foregroundStyle(.secondary)
                }
            }
            Text(nail.caption.isEmpty ? "" : nail.caption)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 160, alignment: .leading)
        }
        .accessibilityElement(children: .combine)
    }
}
