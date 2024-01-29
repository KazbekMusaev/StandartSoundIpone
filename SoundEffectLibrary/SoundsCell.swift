//
//  SoundsCell.swift
//  SoundEffectLibrary
//
//  Created by apple on 29.01.2024.
//

import UIKit


final class SoundsCell: UICollectionViewCell {
    
    static let reuseId = "SoundsCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(codeForSound)
        addSubview(tapToItem)
        
        NSLayoutConstraint.activate([
            codeForSound.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            codeForSound.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            codeForSound.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            tapToItem.bottomAnchor.constraint(equalTo: bottomAnchor),
            tapToItem.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func getSoundsCode(code: Int) {
        self.codeForSound.text = "AudioServicesPlaySystemSound(SystemSoundID(\(String(code)))" 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tapToItem: UILabel = {
        $0.text = "Нажмите на ячейку"
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .gray
        return $0
    }(UILabel())
    
    private lazy var codeForSound: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.textColor = .black
        return $0
    }(UILabel())
    
}
