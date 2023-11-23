//
//  ImageStyle.swift
//  WonderImageGenerator
//
//  Created by Arsenii Dudyk on 15/11/23.
//

import Foundation

enum ImageStyle: String, CaseIterable {
    case surrealism
    case realism
    case threeDrender
    case minimalism
    case abstract
    case retro
    case geometric
    case cinematic
    
    var title: String {
        switch self {
        case .surrealism:
            return "Surrealism"
        case .realism:
            return "Realism"
        case .threeDrender:
            return "3D Render"
        case .minimalism:
            return "Minimalism"
        case .abstract:
            return "Abstract"
        case .retro:
            return "Retro"
        case .geometric:
            return "Geometric"
        case .cinematic:
            return "Cinematic"
        }
    }
}
