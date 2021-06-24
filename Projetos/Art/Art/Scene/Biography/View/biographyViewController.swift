//
//  BiografyViewController.swift
//  Art
//
//  Created by Beatriz Carlos on 23/06/21.
//

import UIKit

class biographyViewController: UIViewController {
    let contentView: biographyView = {
        let view = biographyView(frame: UIScreen.main.bounds)
        view.dismissButton.addTarget(self, action: #selector(dismissButton), for: .touchUpInside)
        return view
    }()
    
    convenience init(authorID: String ) {
        self.init()
        getData(authorID: authorID)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    @objc func dismissButton(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    private func getData(authorID: String) {
        guard let author = Mock.shared.getAuthor(authorID: authorID) else { return }
        self.contentView.authorLabel.text = author.author
        self.contentView.descriptionLabel.text = author.biography
    }
}
