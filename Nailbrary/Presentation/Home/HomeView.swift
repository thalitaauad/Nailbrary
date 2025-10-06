//
//  HomeView.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    VStack(spacing: 12) {
                        Text("💅").font(.system(size: 56))
                        Text(vm.title)
                            .font(.title3).bold()
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Text("Your nail looks")
                        .font(.headline)
                        .padding(.horizontal)

                    if vm.nails.isEmpty {
                        Text("You don’t have any saved nail looks yet :(")
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 14) {
                                ForEach(vm.nails) { nail in
                                    NailCardView(nail: nail)
                                }
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 8)
                        }
                    }

                    VStack(spacing: 12) {
                        NavigationLink {
                            AddNailView(vm: .init(env: vm.env))
                        } label: {
                            Label("Add new nail", systemImage: "camera")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)

                        NavigationLink {
                            PolishesListView(vm: .init(env: vm.env))
                        } label: {
                            Label("Polishes List", systemImage: "paintbrush")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
                .padding(.top)
            }
            .navigationTitle("Nailbrary")
            .onAppear { vm.reload() }
        }
    }
}
