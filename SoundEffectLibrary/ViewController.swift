//
//  ViewController.swift
//  SoundEffectLibrary
//
//  Created by apple on 29.01.2024.
//

import UIKit
import AudioToolbox

final class ViewController: UIViewController {
    
    var soundArray : [Int] = []
    
    private func settupSounds() -> [Int] {
        var array : [Int] = []
        for i in 1000...5000 {
            array.append(i)
        }
        return array
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        soundArray = settupSounds()
        view.addSubview(collection)
    }
    
    private lazy var collection: UICollectionView = {
        $0.register(SoundsCell.self, forCellWithReuseIdentifier: SoundsCell.reuseId)
        $0.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.reuseId)
        $0.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: view.bounds, collectionViewLayout: layout))

    private lazy var layout: UICollectionViewFlowLayout = {
        $0.itemSize = CGSize(width: view.bounds.width - 40, height: 80)
        $0.headerReferenceSize = CGSize(width: (view.bounds.width - 40), height: 60)
        return $0
    }(UICollectionViewFlowLayout())
    
    

}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AudioServicesPlaySystemSound(SystemSoundID(soundArray[indexPath.item]))
    }
}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        soundArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SoundsCell.reuseId, for: indexPath) as? SoundsCell else { return UICollectionViewCell() }
        cell.getSoundsCode(code: soundArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Header.reuseId, for: indexPath) as? Header else {return UICollectionReusableView() }
        return header
    }
    
    
}


