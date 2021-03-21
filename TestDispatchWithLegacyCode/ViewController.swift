//
//  ViewController.swift
//  TestDispatchWithLegacyCode
//
//  Created by Fabio Cuomo on 21/03/2021.
//

import UIKit

public class ViewController: UIViewController {
    public let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let loader: Loader
    
    public init(loader: Loader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addLabel()
        loader.load { [weak self] message in
            DispatchQueue.main.async {
                self?.label.text = message
            }
        }
    }

    private func addLabel() {
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        label.text = "Loading..."
    }
}

