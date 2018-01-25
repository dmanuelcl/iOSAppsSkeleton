//
//  FontsManager.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 9/15/17.
//  Copyright © ____PROJECTNAME____. All rights reserved.
//

import Foundation
import CoreGraphics
import CoreText

final class FontsManager{
    static let shared: FontsManager = FontsManager()

    func dynamicallyLoadFont(fontName: String){
        guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: "otf", subdirectory: "Fonts") else {return}
        guard let fontData = try? Data(contentsOf: fontURL) else {return}
        guard let provider: CGDataProvider = CGDataProvider(data: fontData as CFData) else {return}
        guard let font = CGFont(provider) else {return}
        CTFontManagerRegisterGraphicsFont(font, nil)
    }

}
