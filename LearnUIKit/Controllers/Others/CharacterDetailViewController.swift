//
//  CharacterDetailViewController.swift
//  LearnUIKit
//
//  Created by Duc Do on 26/05/2023.
//

import UIKit

final class CharacterDetailViewController: UIViewController {

    init(viewModel: CharacterDetailViewViewModel) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
    }
}
