//
//  FooterLoadingCollectionReusableView.swift
//  LearnUIKit
//
//  Created by Duc Do on 29/05/2023.
//

import UIKit

final class FooterLoadingCollectionReusableView: UICollectionReusableView {
      static let id = "FooterLoadingCollectionReusableView"
    
    private let spinner: UIActivityIndicatorView = {
       let spinner = UIActivityIndicatorView()
        
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(spinner)
        addConstraints()
        startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func startAnimating() {
        spinner.startAnimating()
    }
}
