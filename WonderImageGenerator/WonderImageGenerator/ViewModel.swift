//
//  ViewModel.swift
//  WonderImageGenerator
//
//  Created by Arsenii Dudyk on 16/11/23.
//

import SwiftUI
import OpenAIKit

final class ViewModel: ObservableObject {
    
    private var openAI: OpenAI?
    let apiKey = "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"
    
    func setup() {
        openAI = OpenAI(
            Configuration(
                organizationId: "Personal",
                apiKey: apiKey
            )
        )
    }
    
    func generateImage(from prompt: String) async -> UIImage? {
        guard let openAI = openAI else {
            return nil
        }
        
        let imageParameters = ImageParameters(
            prompt: prompt,
            resolution: .medium,
            responseFormat: .base64Json
        )
    
        do {
            let result = try await openAI.createImage(parameters: imageParameters)
            let imageData = result.data[0].image
            let image = try openAI.decodeBase64Image(imageData)
            return image
            
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
