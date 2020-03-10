//
//  LoadableViewController.swift
//  mvp-ios-sample-project
//
//  Created by Fotev Marian on 10.03.2020.
//  Copyright © 2020 Marian Fotev. All rights reserved.
//

import UIKit

protocol LoadingPresentable {
    
    func didChangeLoadingState(_ state: Bool)
}

class LoadableViewController: UIViewController {
    
    private let spinner: UIActivityIndicatorView = {
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        
        activityIndicator.color = .gray
        
        return activityIndicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension LoadableViewController: LoadingPresentable {
    
    func didChangeLoadingState(_ state: Bool) {
           if state {
               spinner.startAnimating()
           } else {
               spinner.stopAnimating()
           }
       }
}
