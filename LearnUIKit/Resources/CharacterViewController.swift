//
//  CharacterViewController.swift
//  LearnUIKit
//
//  Created by Duc Do on 12/05/2023.
//

import UIKit

class CharacterViewController: UIViewController, CharacterListViewDelegate {
    
    private let characterListView = CharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    private func setUpView() {
        characterListView.delegate = self
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        view.addSubview(characterListView)
        
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func characterListView(_ characterListView: CharacterListView, didSelectCharacter character: Character) {
        let viewModel = CharacterDetailViewViewModel(character: character)
        let detailVC = CharacterDetailViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
