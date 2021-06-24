//
//  BiografyView.swift
//  Art
//
//  Created by Beatriz Carlos on 23/06/21.
//

import UIKit

class biographyView: UIView {
    lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(UIColor(red: 0.16, green: 0.36, blue: 0.51, alpha: 1.00), for: .normal)
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var birthDateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = attributedText(withString: String(format: "Data do Nascimento: %@", "30/03/1853"), boldString: "Data do Nascimento:", font: .systemFont(ofSize: 17))
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var deathDateLabel: UILabel = {
        let label = UILabel()
        label.attributedText = attributedText(withString: String(format: "Data da Morte: %@", "29/07/1890 (aos 37 anos)"), boldString: "Data da Morte:", font: .systemFont(ofSize: 17))
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ocupationLabel: UILabel = {
        let label = UILabel()
        label.attributedText = attributedText(withString: String(format: "Ocupação: %@", "Pintor Holandês"), boldString: "Ocupação:", font: .systemFont(ofSize: 17))
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.addSubview(dismissButton)
        self.addSubview(authorLabel)
        self.addSubview(birthDateLabel)
        self.addSubview(deathDateLabel)
        self.addSubview(ocupationLabel)
        self.addSubview(descriptionLabel)
        
        setConstraints()
    }
    
    func attributedText(withString string: String, boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                         attributes: [NSAttributedString.Key.font: font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (string as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            dismissButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            authorLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            birthDateLabel.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 16),
            birthDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            deathDateLabel.topAnchor.constraint(equalTo: self.birthDateLabel.bottomAnchor, constant: 6),
            deathDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            ocupationLabel.topAnchor.constraint(equalTo: self.deathDateLabel.bottomAnchor, constant: 6),
            ocupationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: self.ocupationLabel.bottomAnchor, constant: 32),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
