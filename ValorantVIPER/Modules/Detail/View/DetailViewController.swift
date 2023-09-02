//
//  DetailViewController.swift
//  ValorantVIPER
//
//  Created by Cenk Bahadır Çark on 28.08.2023.
//

import UIKit

protocol DetailViewProtocol {
    var presenter: DetailModule.Presenter? { get set }
    
    func updateView(with model: AgentDataResponse)
}

final class DetailViewController: UIViewController, DetailViewProtocol{
    var presenter: DetailModule.Presenter?

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }
    
    func updateView(with model: AgentDataResponse) {
        self.nameLabel.text = model.displayName ?? ""
    }
}
