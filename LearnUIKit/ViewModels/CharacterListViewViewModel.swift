//
//  CharacterListViewViewModel.swift
//  LearnUIKit
//
//  Created by Duc Do on 24/05/2023.
//

import Foundation
import UIKit

final class CharacterListViewViewModel: NSObject {
    func fetch() {
        Service.shared.exec(.listCharactersRequests, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension CharacterListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
}
