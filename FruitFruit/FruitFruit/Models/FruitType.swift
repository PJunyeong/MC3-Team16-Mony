//
//  FruitName.swift
//  FruitFruit
//
//  Created by Junyeong Park on 2022/07/21.
//

import Foundation

enum FruitType: String {
    case Orange = "오렌지"
    case Peach = "복숭아"
    case Watermelon = "수박"
    case Banana = "바나나"
    case Grape = "포도"
    case Apple = "사과"

    var fruitName: String {
        switch self {
        case .Orange:
            return "Orange"
        case .Peach:
            return "Peach"
        case .Watermelon:
            return "Watermelon"
        case .Banana:
            return "Banana"
        case .Grape:
            return "Grape"
        case .Apple:
            return "Apple"
        }
    }
    
    var fruitImageName: String {
        switch self {
        case .Orange:
            return Constants.FruitfruitImages.Fruits.orange
        case .Peach:
            return Constants.FruitfruitImages.Fruits.peach
        case .Watermelon:
            return Constants.FruitfruitImages.Fruits.watermelon
        case .Banana:
            return Constants.FruitfruitImages.Fruits.banana
        case .Grape:
            return Constants.FruitfruitImages.Fruits.grape
        case .Apple:
            return Constants.FruitfruitImages.Fruits.apple
        }
    }
    
    var fruitColorName: String {
        switch self {
        case .Orange:
            return Constants.FruitfruitColors.orange1
        case .Peach:
            return Constants.FruitfruitColors.peach
        case .Watermelon:
            return Constants.FruitfruitColors.watermelon
        case .Banana:
            return Constants.FruitfruitColors.banana
        case .Grape:
            return Constants.FruitfruitColors.grape
        case .Apple:
            return Constants.FruitfruitColors.apple
        }
    }
}
