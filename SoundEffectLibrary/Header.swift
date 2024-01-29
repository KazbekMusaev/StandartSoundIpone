//
//  Header.swift
//  SoundEffectLibrary
//
//  Created by apple on 29.01.2024.
//

import UIKit

final class Header: UICollectionReusableView {
     static let reuseId = "Header"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "AudioToolbox - список звуков"
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        return $0
    }(UILabel())
    
}
