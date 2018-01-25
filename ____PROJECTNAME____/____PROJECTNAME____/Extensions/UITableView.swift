//
//  UITableView.swift
//  ____PROJECTNAME____
//
//  Created by Dani Manuel on 9/16/17.
//  Copyright © ____PROJECTNAME____. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

extension UITableView: DZNEmptyDataSetSource{
    
    private struct associatedKeys {
        static var emptyStateConfigIntance: String = "emptyStateConfigIntanceKey"
        static var emptyStateTitle: String = "emptyStateTitleKey"
        static var emptyStateDescription: String = "emptyStateDescriptionKey"
    }
    
    struct EmptyStateConfig {
        var title: String?
        var titleFont: UIFont
        var titleColor: UIColor
        
        var description: String?
        var descriptionFont: UIFont
        var descriptionColor: UIColor
        
        var image: UIImage?
        
        var buttonTitle: String?
        var buttonTitleFont: UIFont
        var buttonTitleColor: UIColor
        
        var backgroundColor: UIColor
        
        init(title: String? = nil, titleFont: UIFont = UIFont.systemFont(ofSize: 24, weight: .bold), titleColor: UIColor = UIColor.darkText, description: String? = nil, descriptionFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .medium), descriptionColor: UIColor = UIColor.gray, image: UIImage? = nil, buttonTitle: String? = nil, buttonTitleFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .medium), buttonTitleColor: UIColor = UIColor.black, backgroundColor: UIColor = UIColor.white){
            self.title = title
            self.titleFont = titleFont
            self.titleColor = titleColor
            self.description = description
            self.descriptionFont = descriptionFont
            self.descriptionColor = descriptionColor
            self.image = image
            self.buttonTitle = buttonTitle
            self.buttonTitleFont = buttonTitleFont
            self.buttonTitleColor = buttonTitleColor
            self.backgroundColor = backgroundColor
        }
    }
    
    var emptyStateConfig: EmptyStateConfig{
        get{
            return associatedObject(base: self, key: &associatedKeys.emptyStateConfigIntance){
                return EmptyStateConfig()
            }
        }
        set(value){
            associateObject(base: self, key: &associatedKeys.emptyStateConfigIntance, value: value)
        }
    }
    
    func configureEmptyDataSet(config: EmptyStateConfig, delegate: DZNEmptyDataSetDelegate? = nil){
        self.emptyStateConfig = config
        self.emptyDataSetSource = self
        self.emptyDataSetDelegate = delegate
        self.tableFooterView = UIView()
    }
    
    
    public func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = self.emptyStateConfig.title ?? ""
        let emptyTitleAttributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: self.emptyStateConfig.titleFont, NSAttributedStringKey.foregroundColor: self.emptyStateConfig.titleColor]
        return NSAttributedString(string: title, attributes: emptyTitleAttributes)
    }
    
    public func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let description = self.emptyStateConfig.description ?? ""
        let emptyDescriptionAttributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: self.emptyStateConfig.descriptionFont, NSAttributedStringKey.foregroundColor: self.emptyStateConfig.descriptionColor]
        return NSAttributedString(string: description, attributes: emptyDescriptionAttributes)
    }
    
    public func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return self.emptyStateConfig.image ?? UIImage()
    }
    
    public func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControlState) -> NSAttributedString! {
        let title = self.emptyStateConfig.buttonTitle ?? ""
        
        let emptyButtomTitleAttributes: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: self.emptyStateConfig.buttonTitleFont, NSAttributedStringKey.foregroundColor: self.emptyStateConfig.buttonTitleColor]
        return NSAttributedString(string: title, attributes: emptyButtomTitleAttributes)
    }
    
    public func backgroundColor(forEmptyDataSet scrollView: UIScrollView!) -> UIColor! {
        return self.emptyStateConfig.backgroundColor
    }
    
    override open func responds(to aSelector: Selector!) -> Bool {
        let respondToSelector = super.responds(to: aSelector)
        switch aSelector {
        case #selector(self.title(forEmptyDataSet:)):
            return self.emptyStateConfig.title != nil
        case #selector(self.description(forEmptyDataSet:)):
            return self.emptyStateConfig.description != nil
        case #selector(self.image(forEmptyDataSet:)):
            return self.emptyStateConfig.image != nil
        case #selector(self.buttonTitle(forEmptyDataSet:for:)):
            return self.emptyStateConfig.buttonTitle != nil
        default:
            return respondToSelector
        }
    }
}
