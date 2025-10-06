//
//  AddNailViewModel.swift
//  Nailbrary
//
//  Created by Thalita Prado Auad on 15/09/25.
//

import Foundation
import PhotosUI
import _PhotosUI_SwiftUI
internal import Combine

@MainActor
final class AddNailViewModel: ObservableObject {
    
    @Published var pickerItem: PhotosPickerItem?
    @Published var photoData: Data?
    @Published var caption: String = ""
    @Published var selectedPolishes: [Polish] = []
    @Published var error: String?
    @Published var didSave = false
    
    let env: AppEnvironment
    init(env: AppEnvironment) { self.env = env }
    
    func loadPickedImage() {
        Task {
            if let data = try? await pickerItem?.loadTransferable(type: Data.self) {
                self.photoData = data
            }
        }
    }
    
    func save() {
        do {
            var url: URL? = nil
            if let data = photoData {
                url = try env.imageStore.saveImage(data, suggestedName: "nail")
            }
            _ = try CreateNailEntry(nails: env.nailsRepo, date: env.dateProvider)(
                photoURL: url,
                caption: caption,
                polishes: selectedPolishes
            )
            caption = ""
            selectedPolishes.removeAll()
            photoData = nil
            didSave = true
        } catch {
            self.error = "failed to save"
        }
    }
}
