//
//  PolishesListView.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import SwiftUI

struct PolishesListView: View {
    @StateObject var vm: PolishesListViewModel

    var body: some View {
        List {
            ForEach(vm.polishes) { p in
                HStack(spacing: 12) {
                    if let url = p.photoURL, let img = UIImage(contentsOfFile: url.path) {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 48, height: 48)
                            .foregroundStyle(.quaternary)
                            .overlay(Image(systemName: "paintpalette").imageScale(.small))
                    }

                    VStack(alignment: .leading) {
                        Text(p.name).font(.headline)
                        if let b = p.brand, !b.isEmpty {
                            Text(b).font(.subheadline).foregroundStyle(.secondary)
                        }
                    }

                    Spacer()

                    if vm.selectionMode {
                        Image(systemName: vm.selected.contains(p.id) ? "checkmark.circle.fill" : "circle")
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture { if vm.selectionMode { vm.toggle(p) } }
            }
        }
        .searchable(text: Binding(get: { vm.query }, set: { vm.query = $0; vm.search($0) }))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(destination: AddPolishView(env: vm.env) { vm.reload() }) {
                    Image(systemName: "plus")
                }
            }
            if vm.selectionMode {
                ToolbarItem(placement: .bottomBar) {
                    Button("Use selected") { vm.confirm() }
                        .disabled(vm.selected.isEmpty)
                }
            }
        }
        .navigationTitle("Polishes")
    }
}
