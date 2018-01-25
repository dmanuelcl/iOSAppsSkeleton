//
//  String.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 10/2/17.
//  Copyright (c) ____PROJECTNAME____. All rights reserved.
//
import Foundation

extension String{
    func emailAddresses() -> [String] {
        var addresses = [String]()
        if let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) {
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            for match in matches {
                if let matchURL = match.url,
                    let matchURLComponents = URLComponents(url: matchURL, resolvingAgainstBaseURL: false),
                    matchURLComponents.scheme == "mailto"
                {
                    let address = matchURLComponents.path
                    addresses.append(String(address))
                }
            }
        }
        return addresses
    }
    
    var isEmail: Bool{
        let emailAddresses = self.emailAddresses()
        guard emailAddresses.count == 1, emailAddresses.first?.count == self.count else {
            return false
        }
        return true
    }
}
