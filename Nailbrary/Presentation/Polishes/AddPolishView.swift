//
//  AddPolishView.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import SwiftUI
import PhotosUI

struct AddPolishView: View {
    let env: AppEnvironment
    var onCreated: () -> Void = {}

    @State private var name = ""
    @State private var brand = ""
    @State private var picker: PhotosPickerItem?
    @State private var photoData: Data?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section("Details") {
                TextField("Polish name", text: $name)
                TextField("Brand (optional)", text: $brand)
            }

            Section("Photo") {
                PhotosPicker(selection: $picker, matching: .images) {
                    Label(photoData == nil ? "Select photo" : "Change photo", systemImage: "photo")
                }
                if let data = photoData, let img = UIImage(data: data) {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }

            Button {
                do {
                    var url: URL? = nil
                    if let data = photoData {
                        url = try env.imageStore.saveImage(data, suggestedName: "polish")
                    }
                    _ = try CreatePolish(repo: env.polishesRepo)(
                        name: name.trimmingCharacters(in: .whitespacesAndNewlines),
                        brand: brand.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : brand,
                        photoURL: url
                    )
                    onCreated()
                    dismiss()
                } catch {
                    // TODO: show an alert if you want
                }
            } label: {
                Label("Save", systemImage: "tray.and.arrow.down.fill")
                    .frame(maxWidth: .infinity)
            }
            .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .navigationTitle("New polish")
        .onChange(of: picker) { _, it in
            Task { photoData = try? await it?.loadTransferable(type: Data.self) }
        }
    }
}
