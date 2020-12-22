//
//  Utilities.swift
//  TwitterClone
//
//  Created by Павел Левищев on 22.12.2020.
//

import UIKit

class Utilities {
    func inputContainerView(with image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let imageView = UIImageView()
        imageView.image = image
        
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.addSubview(imageView)
        imageView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, paddingLeft: 8, paddingBottom: 8)
        imageView.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: imageView.rightAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 8, paddingBottom: 8)
        
        let divView = UIView()
        divView.backgroundColor = .white
        view.addSubview(divView)
        divView.anchor(left: view.leftAnchor,
                       bottom: view.bottomAnchor,
                       right: view.rightAnchor,
                       paddingLeft: 8,
                       paddingRight: 8,
                       height: 0.7)
        
        return view
    }
    
    func textField(with placeHolder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeHolder
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        return textField
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart,
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: secondPart,
                                                  attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                               NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }
}
