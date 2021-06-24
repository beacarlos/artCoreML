//
//  HomeView.swift
//  Art
//
//  Created by Beatriz Carlos on 21/06/21.
//

import UIKit

class HomeView: UIView {
    
    lazy var moldure: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "moldura")
        return image
    }()
    
    lazy var artObjectImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints =  false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        return image
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "O artista é "
        label.tintColor = .black
        label.font = .systemFont(ofSize: 28, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.tintColor = .black
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var seeMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ver biografia do autor", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(UIColor(red: 0.16, green: 0.36, blue: 0.51, alpha: 1.00), for: .normal)
        button.backgroundColor = .clear
        button.isHidden = true
        return button
    }()
    
    lazy var selectButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Selecione imagem", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.16, green: 0.36, blue: 0.51, alpha: 1.00)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.98, blue: 1.00, alpha: 1.00)
        self.addSubview(moldure)
        self.addSubview(artObjectImage)
        self.addSubview(authorLabel)
        self.addSubview(authorNameLabel)
        self.addSubview(seeMoreButton)
        self.addSubview(selectButton)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            moldure.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            moldure.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            moldure.heightAnchor.constraint(equalToConstant: 400),
            moldure.widthAnchor.constraint(equalToConstant: 400),

            artObjectImage.centerYAnchor.constraint(equalTo: self.moldure.centerYAnchor),
            artObjectImage.heightAnchor.constraint(equalToConstant: 300),
            artObjectImage.widthAnchor.constraint(equalToConstant: 300),
            artObjectImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: self.moldure.bottomAnchor, constant: 60),
            authorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            authorNameLabel.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 20),
            authorNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            seeMoreButton.topAnchor.constraint(equalTo: self.authorNameLabel.bottomAnchor, constant: 40),
            seeMoreButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            selectButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            selectButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
