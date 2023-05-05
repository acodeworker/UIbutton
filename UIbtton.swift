//
//  UIbtton.swift
//  LoginDemo
//
//  Created by jeremy on 2023/5/5.
//  Copyright © 2023 aqara. All rights reserved.
//

import Foundation
import UIKit

public extension UIButton {
  
  @objc func alignHorizontal(spacing: CGFloat, imageFirst: Bool,padding:CGFloat) {
    let edgeOffset = spacing / 2
    
    if #available(iOS 15.0, *) {
      var config = UIButton.Configuration.filled()
      config.imagePadding = spacing
      config.imagePlacement = imageFirst ? .leading :.trailing
      config.contentInsets = NSDirectionalEdgeInsets(top:padding, leading: padding, bottom: padding, trailing: padding)
      self.configuration = config
      return
    }
    
    if imageFirst {

      imageEdgeInsets = UIEdgeInsets(top: 0,
                                     left: -edgeOffset,
                                     bottom: 0,
                                     right: edgeOffset)
      titleEdgeInsets = UIEdgeInsets(top: 0,
                                     left: edgeOffset,
                                     bottom: 0,
                                     right: -edgeOffset)
    } else {
      guard let imageSize = self.imageView?.image?.size,
            let text = self.titleLabel?.text,
            let font = self.titleLabel?.font
      else {
        return
      }
      let labelString = NSString(string: text)
      let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: font])
      imageEdgeInsets = UIEdgeInsets(top: 0,
                                     left: titleSize.width + edgeOffset,
                                     bottom: 0,
                                     right: -titleSize.width - edgeOffset)
      titleEdgeInsets = UIEdgeInsets(top: 0,
                                     left: -imageSize.width - edgeOffset,
                                     bottom: 0,
                                     right: imageSize.width + edgeOffset)
    }
    self.titleLabel?.numberOfLines = 2

    // increase content width to avoid clipping
    contentEdgeInsets = UIEdgeInsets(top: 0-padding, left: edgeOffset-padding, bottom: 0-padding, right: edgeOffset-padding)
  }
  
  @objc func  alignVertical(spacing: CGFloat, imageTop: Bool) {
    
    if #available(iOS 15.0, *) {
      var config = UIButton.Configuration.filled()
      config.imagePadding = spacing
      config.imagePlacement = imageTop ? .top :.bottom
      let padding = 0.0
      config.contentInsets = NSDirectionalEdgeInsets(top:padding, leading: padding, bottom: padding, trailing: padding)
      self.configuration = config
      return
    }
    
    guard let imageSize = self.imageView?.image?.size,
          let text = self.titleLabel?.text,
          let font = self.titleLabel?.font
    else {
      return
    }
    let labelString = NSString(string: text)
    let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: font])
    
    let imageVerticalOffset = (titleSize.height + spacing)/2
    let titleVerticalOffset = (imageSize.height + spacing)/2
    let imageHorizontalOffset = (titleSize.width)/2
    let titleHorizontalOffset = (imageSize.width)/2
    let sign: CGFloat = imageTop ? 1 : -1
    
    imageEdgeInsets = UIEdgeInsets(top: -imageVerticalOffset * sign,
                                   left: imageHorizontalOffset,
                                   bottom: imageVerticalOffset * sign,
                                   right: -imageHorizontalOffset)
    titleEdgeInsets = UIEdgeInsets(top: titleVerticalOffset * sign,
                                   left: -titleHorizontalOffset,
                                   bottom: -titleVerticalOffset * sign,
                                   right: titleHorizontalOffset)
    self.titleLabel?.numberOfLines = 2
    // increase content height to avoid clipping
    let edgeOffset = (min(imageSize.height, titleSize.height) + spacing)/2
    contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0, bottom: edgeOffset, right: 0)
  }
  
}
