//
//  AddNailView.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import SwiftUI
import PhotosUI

struct AddNailView: View {
    @StateObject var vm: AddNailViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("Photo") {
                PhotosPicker(
                    selection: $vm.pickerItem,
                    matching: .images
                ) {
                    Label(vm.photoData == nil ? "Select photo" : "Change photo", systemImage: "photo")
                }
                if let data = vm.photoData, let img = UIImage(data: data) {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 220)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }

            Section("Caption") {
                TextField("Describe the look", text: $vm.caption, axis: .vertical)
                    .lineLimit(2...6)
            }

            Section("Polishes used") {
                NavigationLink("Pick polishes") {
                    PolishesListView(
                        vm: .init(env: vm.env, selectionMode: true) { vm.selectedPolishes = $0 }
                    )
                }
                if vm.selectedPolishes.isEmpty {
                    Text("No polish selected").foregroundStyle(.secondary)
                }
                ForEach(vm.selectedPolishes, id: \.id) { Text($0.name) }
            }

            Button(action: vm.save) {
                Label("Save", systemImage: "tray.and.arrow.down.fill")
                    .frame(maxWidth: .infinity)
            }
            .disabled(vm.caption.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && vm.photoData == nil)
        }
        .navigationTitle("New nail")
        .onChange(of: vm.pickerItem) { _, _ in vm.loadPickedImage() }
        .onChange(of: vm.didSave) { _, saved in if saved { dismiss() } }
    }
}
